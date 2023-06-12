# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

require "csv"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Work
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_controller.include_all_helpers = false
    
    #
    config.middleware.use Rack::Attack

    config.i18n.default_locale = :ja
    config.time_zone = "Asia/Tokyo"
    config.active_record.default_timezone = :local
    config.i18n.load_path += Dir[Rails.root.join("config/locales/*.yml").to_s]
    Faker::Config.locale = :ja
    # Don't generate system test files.
    config.generators do |generator|
      generator.system_tests = nil
      generator.factory_bot dir: "spec/factories"
      generator.test_framework :rspec,
                               javascripts: false,
                               stylesheets: false,
                               helper: false,
                               factory_bot: true,
                               view_specs: false,
                               helper_specs: false,
                               controller_specs: false,
                               routing_specs: false
    end
  end
end
