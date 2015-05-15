class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  layout -> (controller) { controller.request.xhr? ? false : 'application' }

  def set_locale
    if request.subdomain.blank? or request.subdomain == 'www'
      I18n.locale = I18n.default_locale
    else
      I18n.locale = request.subdomain
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a? AdminUser
      admin_dashboard_path
    else
      army_lists_path
    end
  end
end
