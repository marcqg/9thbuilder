module NinthAge
  class SpecialRulesController < ApplicationController

    # GET /ninth_age_special_rules
    # GET /ninth_age_special_rules.json
    def index
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_special_rules = NinthAge::SpecialRule.with_translations.paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @ninth_age_special_rules = NinthAge::SpecialRule.with_translations.all

      respond_to do |format|
        format.json
      end
    end

    # GET /ninth_age_special_rules/1
    # GET /ninth_age_special_rules/1.json
    def show
      @ninth_age_special_rule = NinthAge::SpecialRule.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end
