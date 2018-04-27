module Tournament
  class RoundsController < ApplicationController
    before_action :authenticate_organisation_user!
    before_action :set_event
    before_action :set_round, only: [:show]

    # GET /tournament/event-{event_id}/rounds/{id}
    def show
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