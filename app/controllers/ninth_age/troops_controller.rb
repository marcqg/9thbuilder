module NinthAge
  class TroopsController < ApplicationController
    before_action :set_troop, only: [:show]

    # GET /units/1/troops
    # GET /units/1/troops.json
    def index
      @troops = NinthAge::Troop.where(:unit_id => params[:unit_id])

      respond_to do |format|
        #format.html
        format.json
      end
    end

    # GET /troops/1
    # GET /troops/1.json
    def show
      respond_to do |format|
        #format.html
        format.json
      end
    end

    private

    # -- Utilities

    def set_troop
      @troop = NinthAge::Troop.find(params[:id])
    end
  end
end