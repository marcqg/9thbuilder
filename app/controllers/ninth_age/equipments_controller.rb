module NinthAge
  class EquipmentsController < ApplicationController

    # GET /ninth_age_equipments
    # GET /ninth_age_equipments.json
    def index
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_equipments = NinthAge::Equipment.with_translations.paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @ninth_age_equipments = NinthAge::Equipment.with_translations.all

      respond_to do |format|
        format.json
      end
    end

    # GET /ninth_age_equipments/1
    # GET /ninth_age_equipments/1.json
    def show
      @ninth_age_equipment = NinthAge::Equipment.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end
