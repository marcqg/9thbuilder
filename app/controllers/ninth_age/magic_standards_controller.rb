module NinthAge
  class MagicStandardsController < ApplicationController

    # GET /ninth_age_special_rules
    # GET /ninth_age_special_rules.json
    def index
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_magic_standards = NinthAge::MagicStandard.with_translations.paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @ninth_age_magic_standards = NinthAge::MagicStandard.with_translations.all

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
