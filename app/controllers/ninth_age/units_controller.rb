module NinthAge
  class UnitsController < ApplicationController
    before_action :set_unit, only: [:show]

    # GET /army_organisations.json
    def index
      @units = NinthAge::Unit.where(:army_id => params[:army_id])
                              .includes(:translations)
                              .order(:position)

      respond_to do |format|
        format.json
      end
    end

    # GET /mounts.json
    def mounts
      @units = NinthAge::Unit.where({:army_id => params[:army_id], is_mount: true})
                              .includes(:translations)
                              .order(:position)

      respond_to do |format|
        format.json
      end
    end

    # GET /units/1
    # GET /units/1.json
    def show
      respond_to do |format|
        format.html
        format.json
      end
    end

    private

    # -- Utilities

    def set_unit
      @unit = NinthAge::Unit.find(params[:id])
    end
  end
end