RSpec.configure do |config|
  config.before(:suite) do
    load Rails.root.join('db', 'seeds.rb')
    DatabaseCleaner.clean_with(:truncation, except: %w(languages))
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
