module Tournament
    class TeamsController < ApplicationController
      before_action :authenticate_user!
      before_action :authenticate_organisation_user!
      before_action :set_event
      before_action :set_team, only: [:show, :edit, :update, :destroy]

      # GET /tournament/event-:uuid/teams
      # GET /tournament/event-:uuid/teams
      def index
      end
  
      # GET /tournament/event-:uuid/teams/1
      # GET /tournament/event-:uuid/teams/1.json
      def show
      end
  
      # GET /tournament/event-:uuid/teams/new
      def new
        @team = Tournament::Team.new
        @team.event = @event
        @team.user_applies << Tournament::UserApply.new({:event => @event, :team => @team, :team_leader => true })
      end
  
      # GET /tournament/event-:uuid/teams/1/edit
      def edit
      end
  
      # POST /tournament/event-:uuid/teams
      # POST /tournament/event-:uuid/teams.json
      def create
        @team = Tournament::Team.new(tournament_params)
        @team.event = @event
  
        respond_to do |format|
          if @team.save
        
            send_email(@team)

            format.html { redirect_to tournament_teams_url(@event), notice: 'Team was successfully created.' }
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

            send_email(@team)

            format.html { redirect_to tournament_teams_url(@event), notice: 'Team was successfully updated.' }
            format.json { render :show, status: :ok, location: @event }
          else
            format.html { render action: 'edit' }
            format.json { render json: @team.errors, status: :unprocessable_entity }
          end
        end
      end
  
      # DELETE /tournament/event-:uuid/teams/1
      # DELETE /tournament/event-:uuid/teams/1.json
      def destroy
        @team.destroy
        respond_to do |format|
          format.html { redirect_to tournament_teams_url(@event), notice: 'Team was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
  
      private

      def send_email(team)

            leader = team.user_applies.find_by({:team_leader => true}
            if !leader.nil? && leader.new_record?
              # Tell the UserMailer to send a welcome email after save
              TournamentMailer.create_team_leader(leader).deliver_later
            end
            @team.user_applies
                  .reject { |n| !n.new_record? }
                  .each do |apply|
                TournamentMailer.add_team_member(@team, leader || current_user, apply).deliver_later
            end
      end
  
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
        params.require(:tournament_team).permit(:event_id, :name, user_applies_attributes: [:id, :name, :email, :team_leader, :user_id, :team_id, :event_id, :_destroy])
      end
    end
  end