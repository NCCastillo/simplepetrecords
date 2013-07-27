source 'https://rubygems.org'
ruby "1.9.3"
gem 'rails', '3.2.13'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'zurb-foundation'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

group :development do
  gem 'binding_of_caller'
  gem 'better_errors'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'meta_request'
  gem 'guard-rspec'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'shoulda-context'
  gem 'capybara'
  gem 'selenium-webdriver'
end