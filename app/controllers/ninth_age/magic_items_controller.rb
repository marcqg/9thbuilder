module NinthAge
  class MagicItemsController < ApplicationController

    # GET /ninth_age_magic_items
    # GET /ninth_age_magic_items.json
    def index
      @category = NinthAge::MagicItemCategory.find(params[:category_id])
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_magic_items = NinthAge::MagicItem.includes(:translations)
                                          .where(:magic_item_category_id => params[:category_id])
                                          .paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @version = NinthAge::Version.find(params[:version_id])
      @ninth_age_magic_items = NinthAge::MagicItem.includes(:translations)
                                                    .where(:version_id => params[:version_id])

      if params[:page].present?
        @ninth_age_magic_items = @ninth_age_magic_items.paginate(:page => params[:page].to_i)
      end

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
