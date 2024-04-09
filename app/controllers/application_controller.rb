class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  around_action :switch_locale

  def switch_locale(&action)
    params_locale = I18n.locale_available?(params[:locale]) && params[:locale]
    locale = params_locale || locale_from_header || I18n.default_locale

    I18n.with_locale(locale, &action)
  end

  def locale_from_header
    locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    I18n.locale_available?(locale) && locale
  end
end
