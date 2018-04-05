module NinthAge
  class DomainMagicSpellsController < ApplicationController
    before_action :set_unit, only: [:show]

    # GET /domain_magic_spells.json
    def index
      @domain_magic_spells = NinthAge::DomainMagicSpell.where(:domain_magic_id => params[:domain_magic_id])
                                                       .includes(:translations)

      respond_to do |format|
        format.json
      end
    end

    # GET /domain_magic_spells/1.json
    def show
      respond_to do |format|
        format.json
      end
    end

    private

    # -- Utilities

    def set_unit
      @domain_magic_spell = NinthAge::DomainMagicSpell.find(params[:id])
    end
  end
end