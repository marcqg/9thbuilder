module NinthAge
  class MagicsController < ApplicationController

    # GET /magics
    # GET /magics.json
    def index
      @magics = NinthAge::Magic.all
      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end

    # GET /magics/1
    # GET /magics/1.json
    def show
      @magic = NinthAge::Magic.find_by(:id => params[:id], :ninth_age_version_id => params[:version_id])
      @spells = NinthAge::MagicSpell.where(:ninth_age_magic_id => params[:id])

      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end
  end
end