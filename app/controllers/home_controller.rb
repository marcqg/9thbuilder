class HomeController < ApplicationController
  def index
    redirect_to builder_army_list_path and return if user_signed_in?

    render layout: 'home'
  end
end
