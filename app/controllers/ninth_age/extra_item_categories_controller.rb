module NinthAge
  class ExtraItemCategoriesController < ApplicationController

    # GET /extra_item_categories
    # GET /extra_item_categories.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      page = params[:page].present? ? params[:page].to_i : 1
      @extra_item_categories = NinthAge::ExtraItemCategory.joins(:extra_items)
                                                          .includes(:translations)
                                                          .where(:version_id => params[:version_id])
                                                          .with_locales(I18n.locale)
                                                          .ordered
                                                          .distinct
                                                          .paginate(:page => page)
      respond_to do |format|
        format.html
        format.json
      end
    end

    # GET /extra_item_categories/1
    # GET /extra_item_categories/1.json
    def show
      @category = NinthAge::ExtraItemCategory.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end