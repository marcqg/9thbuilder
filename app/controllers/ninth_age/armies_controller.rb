module NinthAge
  class ArmiesController < ApplicationController

    # GET /armies
    # GET /armies.json
    def index
      @armies = ::Army.where(:version_id => params[:version_id])
      respond_to do |format|
        format.html
        format.json
      end
    end

    # GET /armies/1
    # GET /armies/1.json
    def show
      @army = ::Army.find_by(:id => params[:id], :version_id => params[:version_id])
      @page = params[:page].present? ? params[:page].to_i : 1
      @units = ::Unit.where(army_id: params[:id])
                                 .paginate(:page => @page)
                                 .order(:order)

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end