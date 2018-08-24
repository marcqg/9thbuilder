module NinthAge
  class UnitOptionsController < ApplicationController

    # GET /unit_options.json
    def index
      @unit_options = NinthAge::UnitOption.with_translations.where(:unit_id => params[:unit_id])

      respond_to do |format|
        format.json
      end
    end
  end
end