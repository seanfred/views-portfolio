class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
#  before_filter :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

#protected
#
#def configure_permitted_parameters
#  devise_parameter_sanitizer.for(:sign_up) << [:username, :password, :password_confirmation]
#end
before_filter :set_locale

def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
end

def default_url_options(options={})
    { :locale => I18n.locale }
end




private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action"
    redirect_to request.headers["Referer"] || root_path
  end
end

