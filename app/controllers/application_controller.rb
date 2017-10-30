class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  layout -> (controller) { controller.request.xhr? ? false : 'application' }

  def after_sign_in_path_for(resource)
    if current_user.has_role? :administrator
      admin_dashboard_path
    else
      super
    end
  end

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.has_role? :administrator
      flash[:alert] = 'Unauthorized Access!'
      redirect_to root_path
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :favorite_army_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :favorite_army_id])
    end
end
