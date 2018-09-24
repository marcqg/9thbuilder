module Tournament
    class MyteamsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_team, only: [:show, :edit, :update, :destroy]
 
      # GET /tournament/myteams
      def index
        @teams = current_user.teams
      end
  
      # GET /tournament/myteams/1
      def show
      end
  
      # GET /tournament/myteams/1/add
      def edit
      end
  
      private
    
      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = current_user.teams.find(params[:id])
      end
    end
  end