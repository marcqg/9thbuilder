module Tournament
  class UserAppliesController < ApplicationController
    before_action :set_event
    before_action :set_user_apply, only: [:edit, :update, :destroy]
    before_action :authenticate_organisation_user!, only: [:new, :create, :edit, :update, :destroy]

    # GET /tournament/event-{event_id}/user_applies/add
    def add 
    end

    # GET /tournament/event-{event_id}/user_applies/new
    def new
      @user_apply = Tournament::UserApply.new
      @user_apply.event = @event
    end

    # GET /tournament/events/1/edit
    def edit
    end

    # POST /tournament/event-{event_id}/user_applies/multi
    def multi

      @user_applies = []

      users = params[:users]
      users.each do |user|
        user_apply = Tournament::UserApply.new({name: user['name'], :email => user['email'], event_id: @event.id})
        user_apply.save!

        @user_applies << user_apply
      end

      respond_to do |format|
        format.html { redirect_to tournament_event_url(@event), notice: 'user apply was successfully created.' }
        format.json
      end
    end

    # POST /tournament/event-{event_id}/user_applies/
    def create
      @user_apply = Tournament::UserApply.new(user_apply_params)
      @user_apply.event = @event

      respond_to do |format|
        if @user_apply.save
          format.html { redirect_to tournament_event_url(@event), notice: 'user apply was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @user_apply.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tournament/event-{event_id}/user_applies/1
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

    # DELETE /tournament/event-{event_id}/user_applies/1
    def destroy
      @user_apply.destroy
      respond_to do |format|
        format.html { redirect_to tournament_event_url(@event), notice: 'user apply was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    # POST /tournament/event-{event_id}/user_applies/sort
    def sort
      params[:user_apply].each_with_index do |id, index|
        Tournament::UserApply.where(event_id: @event.id, id: id).update_all(position: index + 1)
      end
      render nothing: true
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = current_user.events.find_by_uuid!(params[:event_id])
      end

      def set_user_apply
      	@user_apply = @event.user_applies.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_apply_params
        params.require(:tournament_user_apply).permit(:name, :email, :user_id, :army_id, :state)
      end
  end
end