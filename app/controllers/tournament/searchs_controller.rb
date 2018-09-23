module Tournament
  class SearchsController < ApplicationController
    before_action :authenticate_user!
  
    def users

      @users = User.where('name like ? OR email like ?', "%#{params[:query]}%" , "%#{params[:query]}%")
      
      respond_to do |format|
        format.json
      end
    end
  end
end  