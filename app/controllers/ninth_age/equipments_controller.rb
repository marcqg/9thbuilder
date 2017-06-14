module NinthAge
  class EquipmentsController < ApplicationController

    # GET /ninth_age_equipments
    # GET /ninth_age_equipments.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_equipments = NinthAge::Equipment.with_translations.where(:version_id => params[:version_id]).paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @version = NinthAge::Version.find(params[:version_id])
      @ninth_age_equipments = NinthAge::Equipment.with_translations.where(:version_id => params[:version_id])

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
