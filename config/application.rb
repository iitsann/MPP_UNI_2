require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Forum
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    config.i18n.available_locales = %i[en ua]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true

    config.to_prepare do
      Devise::SessionsController.layout "application"
      Devise::RegistrationsController.layout proc {|_controller| user_signed_in? ? "application" : "application" }
      Devise::ConfirmationsController.layout "application"
      Devise::UnlocksController.layout "application"
      Devise::PasswordsController.layout "application"
    end
  end
end
