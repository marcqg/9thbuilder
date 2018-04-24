module Tournament
  class OrganisationsController < ApplicationController
    before_action :authenticate_organisation_user!

    # GET /tournament/organisations
    def index
        @events = current_user.events
    end
  end
end