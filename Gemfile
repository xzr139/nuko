source "https://rubygems.org"

ruby "2.2.2"

gem "rails", "4.2.0"

# Database
gem "mysql2"

# Assets
gem "sass-rails"
gem "coffee-rails"
gem "jquery-rails"
gem "uglifier"
gem "jbuilder"
gem "less-rails"
gem "twitter-bootswatch-rails-helpers"
gem "twitter-bootswatch-rails", "~> 3.2.0.0" # 3.3.2.0 ver has a problem
gem "font-awesome-rails"
gem "rails-timeago"
gem "angular_rails_csrf"

# Views
gem "kaminari"
gem "haml-rails"
gem "slim-rails"

# Helpers
gem "rails_autolink"
gem "active_decorator"

# Models
gem "public_activity"
gem "rails4_acts_as_paranoid"
gem "acts-as-taggable-on"

# Auth
gem "omniauth"
gem "omniauth-facebook"
gem "devise"

# nuko settings
gem "rails_config"

# Image uploader
gem "paperclip"

# AWS tool
gem "aws-sdk"

# Search engine
gem "ransack"

# Markdown
gem "redcarpet"
gem 'marked-rails'

# I18n
gem "kaminari-i18n"
gem "i18n-js"

# V8
gem "therubyracer"
gem "execjs"

group :development do
  # Hide logs of assets
  gem "quiet_assets"

  # Export issues for refactoring
  gem "rails_best_practices"

  # Hint for N plus one
  gem "annotate"

  # Suggest corrected word if you missed type
  gem "did_you_mean"

  # PRY utilities
  gem "pry-rails"
  gem "pry-doc"
  gem 'pry-byebug', '1.3.3'
  gem "pry-stack_explorer"
  gem "pry-remote"
end

group :test do
  # View test
  gem "capybara-angular"
  gem "capybara"
  gem "launchy"
  gem "poltergeist"

  # JSON test
  gem "json_spec"

  # Export coverage for RSpec
  gem "simplecov", require: false

  # Faster RSpec
  gem 'test-queue'
  gem "parallel_tests"
end

group :development, :test do
  # Format json and etc...
  gem "awesome_print"

  # Gems related to RSpec
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "database_cleaner", github: "bmabey/database_cleaner"
  gem "spring"
  gem "spring-commands-rspec"
  gem "guard-rspec", require: false
  gem 'terminal-notifier-guard'

  # Awesome tools for debugging
  gem "better_errors"
  gem "binding_of_caller"

  # Checking coding style
  gem "rubocop", require: false

  # Development only mailer
  gem "letter_opener"
end
