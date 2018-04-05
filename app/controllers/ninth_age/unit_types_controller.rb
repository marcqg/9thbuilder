module NinthAge
  class UnitTypesController < ApplicationController
    before_action :set_troop_type, only: [:show]

    # GET /unit_types.json
    def index
      @unit_types = NinthAge::UnitType.all

      respond_to do |format|
        format.json
      end
    end

    # GET /unit_types/1
    # GET /unit_types/1.json
    def show
      respond_to do |format|
        #format.html
        format.json
      end
    end

    private

    # -- Utilities

    def set_troop_type
      @unit_type = NinthAge::UnitType.find(params[:id])
    end
  end
end