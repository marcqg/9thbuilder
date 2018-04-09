module NinthAge
  class EquipmentsController < ApplicationController

    # GET /ninth_age_equipments
    # GET /ninth_age_equipments.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_equipments = NinthAge::Equipment.includes(:translations)
                                                  .where(:version_id => params[:version_id])
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @version = NinthAge::Version.find(params[:version_id])
      @ninth_age_equipments = NinthAge::Equipment.includes(:translations)
                                                  .where(:version_id => params[:version_id])
                                                  .order(:name)

      respond_to do |format|
        format.json
      end
    end

    def army_all
      @army = NinthAge::Army.find(params[:army_id])
      @ninth_age_special_rules = NinthAge::Equipment.includes(:translations)
                                                      .where("(army_id = ? OR army_id IS NULL) AND version_id = ?", @army.id, @army.version_id)
                                                      .order(:name)

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
