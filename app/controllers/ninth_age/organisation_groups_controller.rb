module NinthAge
  class OrganisationGroupsController < ApplicationController

    # GET /organication_groups/1.json
    def show
      @organisation_group = NinthAge::OrganisationGroup.find(params[:id])

      respond_to do |format|
        format.json
      end
    end
  end
end
