module NinthAge
  class OrganisationsController < ApplicationController

    # GET /organications/1.json
    def show
      @organisation = NinthAge::Organisation.find(params[:id])

      respond_to do |format|
        format.json
      end
    end
  end
end
