source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use SCSS for stylesheets
# gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# HTTParty for the RottenTomatoes API calls
gem 'httparty', '0.12.0'

# Twilio gem for text message notifications
gem 'twilio-ruby', '3.11.4'

# Phony_rails gem for number normalization
gem 'phony_rails', '0.4.2'

# Whenever gem for scheduling background jobs
# gem 'whenever', '0.8.4'

# Clockwork gem for scheduling background jobs
gem 'clockwork', '0.7.0'

# Twitter Bootstrap styling
gem "therubyracer"
gem 'less-rails'
gem 'twitter-bootstrap-rails'
# http://stackoverflow.com/questions/15352901/rails-4-app-on-heroku-works-but-errors-in-log

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test, :development do
  # Use sqlite3 as the database for Active Record

  gem 'dotenv-rails'
  gem 'sqlite3'
  gem "rspec-rails"
  gem "capybara"
  gem "selenium-webdriver"
  gem "better_errors"
  gem "binding_of_caller"
  gem "terminal-notifier-guard"
  gem "factory_girl_rails"
  gem "simplecov"
  gem "database_cleaner"
  gem "guard", ">=2.1.0"
  gem "guard-rspec"
  gem "letter_opener"
end

group :production do
  gem "rails_12factor"
  gem "pg"
end

