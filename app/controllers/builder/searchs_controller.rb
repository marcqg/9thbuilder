module Builder
  class SearchsController < ApplicationController
    
    def index
      @versions = NinthAge::Version.includes(:translations)
    end

    def create
      redirect_to builder_search_results_path({:min => params[:min].to_i, :max => params[:max].to_i, :army_id => params[:army], :page => 1})
    end

    def show 

      @army = NinthAge::Army.find(params[:army_id])
      @min = params[:min]
      @max = params[:max]

      @page = params[:page].present? ? params[:page].to_i : 1
      @army_lists = Builder::ArmyList.includes(:army => [:translations])
      								 .where(army_id: params[:army_id])
      							     .where('value_points >= ?', params[:min])
      							     .where('value_points <= ?', params[:max])
                             	     .order(:updated_at => :desc)
                             	     .paginate(:page => @page)
    end
  
  end
end