module NinthAge
  class UnitsController < ApplicationController

    # GET /units/1
    # GET /units/1.json
    def show
      @unit = NinthAge::Unit.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end