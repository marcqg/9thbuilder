module NinthAge
  class ArmiesController < ApplicationController

    # GET /armies
    # GET /armies.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      @armies = NinthAge::Army.includes(:translations).where(:version_id => params[:version_id])
      respond_to do |format|
        format.html
        format.json
      end
    end

    # GET /armies/1
    # GET /armies/1.json
    def show
      @army = NinthAge::Army.find(params[:id])
      @page = params[:page].present? ? params[:page].to_i : 1
      @units = NinthAge::Unit.where(army_id: params[:id])
                                 .order(:order)
                                 .paginate(:page => @page)

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end