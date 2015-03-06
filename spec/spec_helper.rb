ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "pry"
require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist"
require "factory_girl"
require "omniauth"
require "database_cleaner"

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails'
end

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60)
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
  config.include I18nMacros
  config.infer_spec_type_from_file_location!
  config.include Capybara::DSL, type: :request
  config.include Devise::TestHelpers, type: :controller

  config.before(:all) do
    FactoryGirl.reload
  end

  config.before(:suite) do
    load Rails.root.join('db', 'seeds.rb')
    DatabaseCleaner.clean_with(:truncation, except: %w(languages))
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    load Rails.root.join('db', 'seeds.rb')
    DatabaseCleaner.clean_with(:truncation, except: %w(languages))
  end

  config.before(:each) do
    DatabaseCleaner.start
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(create(:user))
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
