module NinthAge
  class VersionsController < ApplicationController

    # GET /versions
    # GET /versions.json
    def index
      @versions = NinthAge::Version.all
      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end

    # GET /versions/1
    # GET /versions/1.json
    def show
      @version = NinthAge::Version.find(params[:id])

      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end
  end
end