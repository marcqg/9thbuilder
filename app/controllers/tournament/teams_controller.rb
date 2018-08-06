module Tournament
    class TeamsController < ApplicationController
      before_action :authenticate_user!
      before_action :authenticate_organisation_user!
      before_action :set_event
      before_action :set_team, only: [:show, :edit, :update, :destroy]
  
      # GET /tournament/event-:uuid/teams/1
      # GET /tournament/event-:uuid/teams/1.json
      def show
      end
  
      # GET /tournament/event-:uuid/teams/new
      def new
        @team = Tournament::Team.new
        @team.event = @event
      end
  
      # GET /tournament/event-:uuid/teams/1/edit
      def edit
      end
  
      # POST /tournament/event-:uuid/teams
      # POST /tournament/event-:uuid/teams.json
      def create
        @team = Tournament::Event.new(tournament_params)
        @team.event = @event
  
        respond_to do |format|
          if @team.save
            format.html { redirect_to tournament_add_user_apply_url(@event), notice: 'event was successfully created.' }
            format.json { render :show, status: :created, location: @event }
          else
            format.html { render :new }
            format.json { render json: @team.errors, status: :unprocessable_entity }
          end
        end
      end
  
      # PATCH/PUT /tournament/event-:uuid/teams/1
      # PATCH/PUT /tournament/event-:uuid/teams/1.json
      def update
        respond_to do |format|
          if @team.update(tournament_params)
            format.html { redirect_to tournament_event_url(@event), notice: 'event was successfully updated.' }
            format.json { render :show, status: :ok, location: @event }
          else
            format.html { render :edit }
            format.json { render json: @team.errors, status: :unprocessable_entity }
          end
        end
      end
  
      # DELETE /tournament/event-:uuid/teams/1
      # DELETE /tournament/event-:uuid/teams/1.json
      def destroy
        @team.destroy
        respond_to do |format|
          format.html { redirect_to tournament_event_url(@event), notice: 'event was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
  
      private
  
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = current_user.events.find_by_uuid!(params[:uuid])
      end
  
      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = @event.teams.find(params[:id])
      end
  
        # Never trust parameters from the scary internet, only allow the white list through.
        def tournament_params
          params.require(:tournament_event).permit(:event_id, :leader_id, :leader_name, :leader_email, :name)
        end
    end
  end