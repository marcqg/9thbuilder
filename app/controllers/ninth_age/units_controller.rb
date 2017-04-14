module NinthAge
  class UnitsController < ApplicationController

    # GET /units/1
    # GET /units/1.json
    def show
      @unit = ::Unit.find(params[:id])

      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end
  end
end