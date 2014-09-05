ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "pry"
require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist"
require "factory_girl"
require "omniauth"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/factories/**/*.rb")].each {|f| require f}

ActiveRecord::Migration.maintain_test_schema!

include Capybara::DSL
Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60)
end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({provider: 'facebook', uid: '733146856734194'})
OmniAuth.config.add_mock(:facebook, YAML.load_file(Rails.root.join('spec', 'data', 'user_mock.yml')))

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods

  config.before(:all) do
    FactoryGirl.reload
  end
end
