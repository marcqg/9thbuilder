module Tournament
  class RoundsController < ApplicationController
    before_action :authenticate_organisation_user!
    before_action :set_event
    before_action :set_round, only: [:show]

    # GET /tournament/event-{event_id}/rounds/{id}
    def show
      if @round.matches.count < (@event.user_applies.count / 2)

        user_in_match_ids = @round.matches.map(&:user_apply_id)

        matches = @event.matches
                    .where.not(user_apply_id: user_in_match_ids)
                    .group_by  {|h| h.user_apply_id}
                    .map{|k,v| [k,v.map{ |h| h.points }.sum] }
                    .sort_by {|k| k[1]}
                    .map{ |k| k[0]}
                    .reverse
                    .in_groups_of(2)
                    .select { |hash| !hash[0].nil? && !hash[1].nil? }

        matches.each_with_index do |group,index|
          group.each do |user|
            Tournament::Match.create!({ 
              :round_id => @round.id, 
              :table => index + 1,
              :user_apply_id => user })
          end
        end

        @round.reload

      end
    end

    # POST /tournament/event-{event_id}/user_applies/
    def create
      @round = Tournament::Round.new({:event_id => @event.id})

      respond_to do |format|
        if @round.save
          format.html { redirect_to tournament_event_url(@event), notice: 'user apply was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @round.errors, status: :unprocessable_entity }
        end
      end
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = current_user.events.find(params[:event_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_round
        @round = @event.rounds.find(params[:id])
      end
  end
end