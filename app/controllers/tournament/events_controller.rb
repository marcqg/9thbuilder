module Tournament
  class EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_organisation_user!, only: [:new, :create, :edit, :update, :destroy]

    # GET /tournament/events
    # GET /tournament/events.json
    def index
      @events = ::Tournament::Event.all
    end

    # GET /tournament/events/1
    # GET /tournament/events/1.json
    def show
    end

    # GET /tournament/events/new
    def new
      @event = Tournament::Event.new
      @event.creator = current_user
    end

    # GET /tournament/events/1/edit
    def edit
    end

    # POST /tournament/events
    # POST /tournament/events.json
    def create
      @event = Tournament::Event.new(tournament_params)
      @event.creator = current_user

      respond_to do |format|
        if @event.save
          format.html { redirect_to tournament_add_user_apply_url(@event), notice: 'event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tournament/events/1
    # PATCH/PUT /tournament/events/1.json
    def update
      respond_to do |format|
        if @event.update(tournament_params)
          format.html { redirect_to tournament_event_url(@event), notice: 'event was successfully updated.' }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tournament/events/1
    # DELETE /tournament/events/1.json
    def destroy
      @event.destroy
      respond_to do |format|
        format.html { redirect_to tournament_organisations_url, notice: 'event was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = current_user.events.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tournament_params
        params.require(:tournament_event).permit(:name, :address, :latitude, :longitude, :start_date, :end_date, :fees, :version_id, :rounds, :user_max)
      end
  end
end