module NinthAge
  class MagicItemCategoriesController < ApplicationController

    # GET /magic_item_categories
    # GET /magic_item_categories.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      page = params[:page].present? ? params[:page].to_i : 1
      @magic_item_categories = NinthAge::MagicItemCategory.joins(:magic_items)
                                                          .includes(:translations)
                                                          .where(:ninth_age_magic_items => {:version_id => params[:version_id]})
                                                          .with_locales(I18n.locale)
                                                          .ordered
                                                          .distinct
                                                          .paginate(:page => page)
      respond_to do |format|
        format.html
        format.json
      end
    end

    # GET /magic_item_categories/1
    # GET /magic_item_categories/1.json
    def show
      @category = NinthAge::MagicItemCategory.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end