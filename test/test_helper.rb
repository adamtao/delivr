ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

Capybara.configure do |config|
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
  config.javascript_driver = :webkit
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include Capybara::DSL

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::RSpecMatchers
  include Capybara::DSL

  setup do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = {
      'uid' => '1234',
      'provider' => 'twitter',
      'info' => {
        'name' => 'JohnnyBravo',
        'email' => 'johnny@test.com'
      }
    }
  end

  teardown do
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    # Capybara.default_driver = :webkit
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
    ActionMailer::Base.deliveries = []
    OmniAuth.config.test_mode = false # Set omniauth back to test mode
  end

end

def last_updated_user
  User.order("updated_at DESC").limit(1).first
end


Turn.config.format = :outline
Turn.config.natural = true
