module Tournament
  class UserAppliesController < ApplicationController
    before_action :set_event
    before_action :set_user_apply, only: [:edit, :update, :destroy]
    before_action :authenticate_organisation_user!, only: [:new, :create, :edit, :update, :destroy]

    # GET /tournament/event-{event_id}/user_apply/new
    def new
      @user_apply = Tournament::UserApply.new
      @user_apply.event = @event
    end

    # GET /tournament/events/1/edit
    def edit
    end

    # POST /tournament/event-{event_id}/user_apply/
    def create

      name = user_apply_params[:name]
      names = (name || "").split("\n")
      					  .map { |r| r.strip }

      saves = true
      applies = []
      names.each do |n|

      	apply = Tournament::UserApply.new({name: n, event = @event})
      	saves &= apply.save

      	applies << apply
      end

      unless saves
      	applies.each do |apply|
      		apply.destroy!
      	end
      end

      respond_to do |format|
        if saves
          format.html { redirect_to tournament_event_url(@event), notice: 'user apply was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /tournament/event-{event_id}/user_apply/1
    def update
      respond_to do |format|
        if @user_apply.update(user_apply_params)
          format.html { redirect_to tournament_event_url(@event), notice: 'user apply was successfully updated.' }
          format.json { render :show, status: :ok, location: @user_apply }
        else
          format.html { render :edit }
          format.json { render json: @user_apply.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tournament/event-{event_id}/user_apply/1
    def destroy
      @user_apply.destroy
      respond_to do |format|
        format.html { redirect_to tournament_event_url(@event), notice: 'user apply was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = current_user.events.find(params[:event_id])
      end

      def set_user_apply
      	@user_apply = @event.user_applies.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_apply_params
        params.require(:tournament_user_apply).permit(:name, :state)
      end
  end
end