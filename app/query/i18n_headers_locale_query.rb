class I18nHeadersLocaleQuery
  attr_accessor :init_request

  def initialize(init_request)
    @init_request = init_request
  end

  def call
    @init_request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first
  end
end
