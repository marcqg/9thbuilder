module NinthAge
  class ArmyOrganisationsController < ApplicationController

    # GET /army_organisations.json
    def index
      @army_organisations = NinthAge::ArmyOrganisation.where(:army_id => params[:army_id])

      respond_to do |format|
        format.json
      end
    end

    # GET /army_organisations/1
    # GET /army_organisations/1.json
    def show
      @army_organisation = NinthAge::ArmyOrganisation.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end
