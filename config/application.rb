require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Raven.configure do |config|
  config.dsn = ENV['SENTRY_DSN']
end

module NineThBuilder
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Paris'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    I18n.available_locales = [:fr, :en, :de, :ko, :pl, :es, :it]
    I18n.default_locale = :en
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:fr, :en, :de, :ko, :pl, :es, :it]
    config.i18n.enforce_available_locales = true
    config.i18n.fallbacks = true

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # CORS configuration
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 :headers => :any,
                 :methods => [:get, :post, :options, :delete, :put],
                 :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end
  end
end
