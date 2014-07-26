source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# HTTParty for the RottenTomatoes API calls
gem 'httparty', '0.12.0'

# Twilio gem for text message notifications
gem 'twilio-ruby', '3.11.4'

# Phony_rails gem for number normalization
gem 'phony_rails', '0.4.2'

# Clockwork gem for scheduling background jobs
gem 'clockwork', '0.7.0'

# Twitter Bootstrap styling
gem "therubyracer"
gem 'less-rails'
gem 'twitter-bootstrap-rails'
# http://stackoverflow.com/questions/15352901/rails-4-app-on-heroku-works-but-errors-in-log

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# Devise for authentication
gem 'devise'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
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