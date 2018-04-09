module Builder
  class SearchsController < ApplicationController
    
    def index

      @versions = NinthAge::Version.includes(:translations)

      respond_to do |format|
        format.html
      end
    end
  
  end
end