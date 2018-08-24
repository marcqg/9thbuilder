module NinthAge
  class DomainMagicsController < ApplicationController

    # GET /magics
    # GET /magics.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      @magics = NinthAge::DomainMagic.where(:version_id => params[:version_id])
                                     .includes(:translations)
      respond_to do |format|
        format.html
        format.json
      end
    end

    # GET /magics/1
    # GET /magics/1.json
    def show
      @magic = NinthAge::DomainMagic.find_by(:id => params[:id])
      @spells = NinthAge::DomainMagicSpell.where(:domain_magic_id => params[:id])
                                          .includes(:translations)

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end