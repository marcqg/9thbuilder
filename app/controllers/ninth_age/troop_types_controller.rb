module NinthAge
  class TroopTypesController < ApplicationController
    before_action :set_troop_type, only: [:show]

    # GET /troop_types/1
    # GET /troop_types/1.json
    def show
      respond_to do |format|
        #format.html
        format.json
      end
    end

    private

    # -- Utilities

    def set_troop_type
      @troop_type = NinthAge::TroopType.find(params[:id])
    end
  end
end