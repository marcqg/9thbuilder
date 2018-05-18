module Tournament
  class RoundsController < ApplicationController
    before_action :authenticate_organisation_user!
    before_action :set_event
    before_action :set_round, only: [:show]

    # GET /tournament/event-{event_id}/rounds/{id}
    def show
      if @round.matches.count < @event.user_max
        p "create match"

        # All users already in this round
        user_in_match_ids = @round.matches
                                  .where(:round_id => @round.id)
                                  .map(&:user_apply_id)
        p "user_in_match_ids"
        p user_in_match_ids

        matches = @event.matches
                        .where.not(:round_id => @round.id)
                        .where.not(:user_apply_id => user_in_match_ids)
                        .group_by  {|h| h.user_apply_id}
                        .map{|k,v| [k,v.map{ |m| m.points }.sum] }
        p "matches"
        p matches

        # All user applies not in this round
        users = @event.user_applies
                              .where.not(id: user_in_match_ids)
                              .map(&:id)
        p "users"
        p users

        users.each do |user|
          matches << [user, 0]
        end
        p "matches"
        p matches

        user_in_matches = matches.group_by  {|h| h[0]}
                                  .map{|k,v| [k,v.map{ |m| m[1] }.sum] }
                                  .sort{|x,y| y[1] <=> x[1]}
                                  .map{ |k| k[0]}

        p "user_in_matches"
        p user_in_matches

        table = @round.matches.count / 2 + 1

        user_in_matches.each_with_index do |user, index|
          Tournament::Match.create!({ 
            :round_id => @round.id, 
            :table => table,
            :user_apply_id => user })

          if (index % 2 == 1)
            table = table + 1
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