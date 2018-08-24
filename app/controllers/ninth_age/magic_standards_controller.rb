module NinthAge
  class MagicStandardsController < ApplicationController

    # GET /ninth_age_special_rules
    # GET /ninth_age_special_rules.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_magic_standards = NinthAge::MagicStandard.includes(:translations)
                                                          .where(:version_id => params[:version_id])
                                                          .with_locales(I18n.locale)
                                                          .ordered
                                                          .paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    # GET /ninth_age_magic_standards/all
    # GET /ninth_age_magic_standards/all.json
    def all
      @version = NinthAge::Version.find(params[:version_id])
      @ninth_age_magic_standards = NinthAge::MagicStandard.includes(:translations)
                                                          .where(:version_id => params[:version_id])

      respond_to do |format|
        format.json
      end
    end

    # GET /ninth_age_magic_standards/1
    # GET /ninth_age_magic_standards/1.json
    def show
      @ninth_age_magic_standard = NinthAge::MagicStandard.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end
