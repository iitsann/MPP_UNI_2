class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def switch_locale(&)
    locale = I18nParamsLocaleQuery.new(params).call(locale_from_header)

    I18n.with_locale(locale, &)
  end

  def locale_from_header
    locale = I18nHeadersLocaleQuery.new(request).call

    I18n.locale_available?(locale) && locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[country city])
  end
end
