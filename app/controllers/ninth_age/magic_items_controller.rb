module NinthAge
  class MagicItemsController < ApplicationController

    # GET /ninth_age_magic_items
    # GET /ninth_age_magic_items.json
    def index
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_magic_items = NinthAge::MagicItem.with_translations.paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @ninth_age_magic_items = NinthAge::MagicItem.with_translations.all

      respond_to do |format|
        format.json
      end
    end

    # GET /ninth_age_magic_items/1
    # GET /ninth_age_magic_items/1.json
    def show
      @ninth_age_magic_item = NinthAge::MagicItem.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end
