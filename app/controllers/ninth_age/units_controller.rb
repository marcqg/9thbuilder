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

    # GET /units/all
    def show_all
      @army = NinthAge::Army.find(params[:army_id])

      @units = NinthAge::Unit.where(:army_id => params[:army_id])
                              .includes(:translations)
                              .includes(:unit_options)
                              .includes(:unit_options => [:translations])
                              .includes(:troops)
                              .includes(:troops => [:translations])
                              .includes(:equipment_unit_troops)
                              .includes(:equipment_unit_troops => [:equipment, :translations])
                              .includes(:special_rule_unit_troops)
                              .includes(:special_rule_unit_troops => [:special_rule, :translations])
                              .order(:position)

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