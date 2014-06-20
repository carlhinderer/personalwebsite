source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '4.0.3'

# Databases
gem 'sqlite3', :groups => [:development, :test]
gem 'pg', :group => :production

# Use Heroku 12-Factor so that assets get served correctly
gem 'rails_12factor', :group => :production

# Use figaro for environment variables
gem 'figaro'

# Use devise for authentication
gem 'devise'

# Use haml for templating
gem 'haml'

# Assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# Use bootstrap for styles
gem 'bootstrap-sass'

# Javascript
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'

# Use friendly_id to generate SEO-friendly URLs for blog posts
gem 'friendly_id'

# Use redcarpet and pygmentize for creating blog posts with code embedded
gem 'redcarpet'
gem 'pygmentize'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Testing
group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'shoulda-matchers'
  gem 'guard-rspec'
  gem 'simplecov', :require => false
  gem 'guard-cucumber'
  gem 'launchy'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

# Code Quality Testing
group :development do
  gem 'reek'
  gem 'metric_fu'
end

# Use railroady for model visualization
gem 'railroady', :groups => [:development, :test]

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn', :group => :production

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]
