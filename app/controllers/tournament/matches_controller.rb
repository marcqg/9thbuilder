module Tournament
  class MatchesController < ApplicationController
    before_action :authenticate_organisation_user!
    before_action :set_event
    before_action :set_round
    before_action :set_match

    # PATCH/PUT /tournament/event-1/round-1/matches
    # PATCH/PUT /tournament/event-1/round-1/matches.json
    def update
      respond_to do |format|
        if @match.update(match_params)
          format.html { redirect_to tournament_match_url(@event, @round, @match), notice: 'match was successfully updated.' }
          format.json { render :show, status: :ok, location: @match }
        else
          format.html { render :edit }
          format.json { render json: @match.errors, status: :unprocessable_entity }
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
        @round = @event.rounds.find(params[:round_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_match
        @match = @round.matches.find(params[:id])
      end
  end
end