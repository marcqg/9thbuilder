module Tournament
  class ExportsController < ApplicationController
  
    # GET /trounaments/1/results
    def index
        @event = Tournament::Event.find(params[:event_id])

        respond_to do |format|
          format.html { render template: "tournament/exports/index.html.erb", layout: 'pdf_event.html.erb' }
          format.pdf { render template: "tournament/exports/index.html.erb", pdf: "9thbuilder_tournament_#{params[:event_id]}", layout: 'pdf_event.html.erb' }
        end
    end
  end
end