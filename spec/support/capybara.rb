Capybara.javascript_driver = :poltergeist
Capybara.asset_host = "http://localhost:3000"
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 60)
end

RSpec.configure do |config|
  config.include Capybara::DSL, type: :request
end
