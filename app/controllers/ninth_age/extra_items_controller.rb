module NinthAge
  class ExtraItemsController < ApplicationController

    # GET /ninth_age_magic_items
    # GET /ninth_age_magic_items.json
    def index
      @version = NinthAge::Version.find(params[:version_id])
      page = params[:page].present? ? params[:page].to_i : 1
      @ninth_age_extra_items = NinthAge::ExtraItem.includes(:translations)
                                                  .joins(:extra_item_category)
                                                  .where('ninth_age_extra_item_categories.version_id = ?', params[:version_id])
                                                  .paginate(:page => page)

      respond_to do |format|
        format.html
        format.json
      end
    end

    def all
      @version = NinthAge::Version.find(params[:version_id])
      @ninth_age_extra_items = NinthAge::ExtraItem.includes(:translations)
                                                  .joins(:extra_item_category)
                                                  .where('ninth_age_extra_item_categories.version_id = ?', params[:version_id])

      respond_to do |format|
        format.json
      end
    end

    def army_all
      @army = NinthAge::Army.find(params[:army_id])
      @ninth_age_extra_items = NinthAge::ExtraItem.joins(:extra_item_category)
                                                  .includes(:translations)
                                                  .where("(ninth_age_extra_item_categories.army_id = ? OR ninth_age_extra_item_categories.army_id IS NULL) AND ninth_age_extra_item_categories.version_id = ?", @army.id, @army.version_id)
                                                  .order(:name)
                                                  
      respond_to do |format|
        format.json
      end
    end
    
    def by_army
      @extra_item_category = NinthAge::ExtraItemCategort.find(params[:extra_item_category_id])
      @ninth_age_extra_items = NinthAge::ExtraItem.joins(:extra_item_category)
                                                  .includes(:translations)
                                                  .where("(ninth_age_extra_item_categories.army_id = ? OR ninth_age_extra_item_categories.army_id IS NULL) AND ninth_age_extra_item_categories.version_id = ?", @extra_item_category.army_id, @extra_item_category.army.version_id)
                                                  .order(:name)
                                                  
      respond_to do |format|
        format.json
      end
    end

    # GET /ninth_age_magic_items/1
    # GET /ninth_age_magic_items/1.json
    def show
      @ninth_age_extra_item = NinthAge::ExtraItem.find(params[:id])

      respond_to do |format|
        format.html
        format.json
      end
    end
  end
end
