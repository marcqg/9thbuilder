class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_raven_context

  layout -> (controller) { controller.request.xhr? ? false : 'application' }

 # def after_sign_in_path_for(resource)
 #   if current_user.has_role? :administrator
 #     admin_dashboard_path
 #   else
 #     super
 #   end
 # end

  def authenticate_active_admin_user!
    authenticate_user!
    unless (current_user.has_role? :moderator or current_user.has_role? :administrator)
      flash[:alert] = 'Unauthorized Access!'
      redirect_to root_path
    end
  end

  def authenticate_organisation_user!
    authenticate_user!
    unless (current_user.has_role? :organisator or current_user.has_role? :administrator)
      flash[:alert] = 'Unauthorized Access!'
      redirect_to root_path
    end
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  # rescue_from Exception, with: :error
  rescue_from ActionController::RoutingError, with: :not_found

  def raise_not_found
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end

  def not_found
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

  def error
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/500", layout: false, status: :error }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :favorite_army_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :favorite_army_id])
    end

  
  private

    def set_raven_context
      Raven.user_context(id: session[:current_user_id]) # or anything else in session
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end
end
