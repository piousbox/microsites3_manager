require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"

require_relative "../lib/string"

# require "ish_models/railtie"
require_relative "initializers/00_s3.rb"

Bundler.require(*Rails.groups)

module Microsites3Manager
  class Application < Rails::Application
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
