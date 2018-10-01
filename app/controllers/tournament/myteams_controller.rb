module Tournament
    class MyteamsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_team, only: [:show, :edit, :update, :destroy, :invitations]
      before_action :set_team_by_token, only: [:invitation_link]
 
      # GET /tournament/myteams
      def index
        @teams = current_user.teams
      end
  
      # GET /tournament/myteams/1
      def show
      end
  
      # GET /tournament/myteams/1/edit
      def edit
      end
  
      # PATCH/PUT /tournament/myteams/1
      # PATCH/PUT /tournament/myteams/1.json
      def update
        respond_to do |format|
          if @team.update(tournament_params)

            @team.user_applies
                  .reject { |n| !n.new_record? }
                  .each do |apply|
              TournamentMailer.add_team_member(@team, leader || current_user, apply).deliver_later
            end

            format.html { redirect_to tournament_teams_url(@event), notice: 'Team was successfully updated.' }
            format.json { render :show, status: :ok, location: @event }
          else
            format.html { render action: 'edit' }
            format.json { render json: @team.errors, status: :unprocessable_entity }
          end
        end
      end

      # GET /tournament/myteam-:id/invitations
      def invitations
        if @team.invitation_token.nil?
          @team.invitation_token = UUIDTools::UUID.random_create.to_s
          @team.invitation_enabled = true
          @team.save!
        end
      end

      # GET /tournament/myteam-:id/invitation/:token
      def invitation_link
      end
  
      private
    
      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = current_user.teams.find(params[:id])
      end
    
      # Use callbacks to share common setup or constraints between actions.
      def set_team_by_token
        @team = Tournament::Team.find_by({:invitation_token => params[:token], :invitation_enabled => true})
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def tournament_params
        params.require(:tournament_team).permit(:name, user_applies_attributes: [:id, :name, :email, :team_leader, :user_id, :team_id, :event_id, :_destroy])
      end
    end
  end