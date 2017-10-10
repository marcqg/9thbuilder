module NinthAge
  class VersionsController < ApplicationController
    before_action :set_version, only: [:show]

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
      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end

    private

    # -- Utilities

    def set_version
      @version = NinthAge::Version.find(params[:id])
    end
  end
end