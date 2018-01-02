module NinthAge
  class SpecialRulesController < ApplicationController

    # GET /ninth_age_special_rules
    # GET /ninth_age_special_rules.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_special_rules = NinthAge::SpecialRule.includes(:translations)
                                                      .where(:version_id => params[:version_id])
                                                      .paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @version = NinthAge::Version.find(params[:version_id])
      @ninth_age_special_rules = NinthAge::SpecialRule.includes(:translations)
                                                      .where(:version_id => params[:version_id])

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
