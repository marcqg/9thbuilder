module NinthAge
  class VersionsController < ApplicationController

    # GET /versions
    # GET /versions.json
    def index
      @versions = NinthAge::Version.all.includes(:translations)
      if !user_signed_in? || (!current_user.has_role?(:Administrator) and !current_user.has_role?(:Moderator))
        @versions = @versions.where(:public => true)
      end

      respond_to do |format|
        format.html
        format.json
      end
    end

    # GET /versions/1
    # GET /versions/1.json
    def show

      @version = NinthAge::Version.find(params[:id])
      if !@version.public && (!user_signed_in? || (!current_user.has_role?(:Administrator) and !current_user.has_role?(:Moderator)))
        raise ActionController::RoutingError.new('Not Found')
      end

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end