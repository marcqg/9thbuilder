module NinthAge
  class MagicsController < ApplicationController

    # GET /magics
    # GET /magics.json
    def index
      @magics = NinthAge::Magic.where(:version_id => params[:version_id])
      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end

    # GET /magics/1
    # GET /magics/1.json
    def show
      @magic = NinthAge::Magic.find_by(:id => params[:id], :version_id => params[:version_id])
      @spells = NinthAge::MagicSpell.where(:magic_id => params[:id])

      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end
  end
end