class I18nParamsLocaleQuery
  attr_accessor :init_params

  def initialize(init_params)
    @init_params = init_params
  end

  def call(locale_from_header)
    params_locale = I18n.locale_available?(@init_params[:locale]) && @init_params[:locale]

    params_locale || locale_from_header || I18n.default_locale
  end
end
