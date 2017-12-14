module NinthAge
  class OrganisationsController < ApplicationController

  	def index 
      @organisations = NinthAge::Organisation.where(:army_id => params[:army_id])
      											.includes(:translations)
                              					.order(:name)

      respond_to do |format|
        format.json
      end
  	end 

    # GET /organications/1.json
    def show
      @organisation = NinthAge::Organisation.find(params[:id])

      respond_to do |format|
        format.json
      end
    end
  end
end
