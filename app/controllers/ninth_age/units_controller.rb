module NinthAge
  class UnitsController < ApplicationController
    before_action :set_unit, only: [:show]

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