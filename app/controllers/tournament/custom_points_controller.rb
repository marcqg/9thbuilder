module Tournament
  class CustomPointsController < ApplicationController
    before_action :authenticate_organisation_user!
    before_action :set_event
    before_action :set_custom_point, only: [:update]

    # GET /tournament/event-{event_id}/custom_points
    def index
      if @event.custom_points.count < @event.user_applies.count

        user_ids = @event.custom_points.map(&:user_apply_id)
        p user_ids

        user_applies = @event.user_applies
                    .where.not(user_applies: {id: user_ids})

        user_applies.each do |user_apply|
          Tournament::CustomPoint.create!({ 
            :event_id => @event.id, 
            :user_apply_id => user_apply.id})
        end

        @event.reload

      end
    end

    # POST /tournament/event-{event_id}/custom_points/{id}
    def update
      respond_to do |format|
        if @custom_point.update(custom_point_params)
          format.html { redirect_to tournament_custom_points_url(@event), notice: 'custom points was successfully updated.' }
          format.json { render :show, status: :ok, location: @custom_point }
        else
          format.html { render :edit }
          format.json { render json: @custom_point.errors, status: :unprocessable_entity }
        end
      end
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = current_user.events.find_by_uuid!(params[:event_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_custom_point
        @custom_point = @event.custom_points.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def custom_point_params
        params.require(:tournament_custom_point).permit(:paint_points, :wysiwyg_points, :list_points)
      end
  end
end