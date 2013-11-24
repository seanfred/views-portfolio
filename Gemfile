source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.14'
gem 'devise'
gem 'pundit'
gem 'strong_parameters'
gem 'bootstrap-sass-rails'
gem 'omniauth-twitter'
gem 'figaro'
gem 'tugboat'
gem 'json'
gem 'browser-timezone-rails'
gem 'globalize'


gem 'coveralls', require: false

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'rails_12factor'
  gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development do
  gem "rails-erd"
end

group :development, :test do
  gem 'minitest', '> 4.0'
  gem 'minitest-rails'
  gem 'sqlite3'
  gem 'minitest-rails-capybara'
  gem 'minitest-focus'
  gem 'minitest-colorize'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-debugger'
  gem 'faker'
  gem 'railroady'
end

group :test do
  gem 'turn'
  gem 'simplecov', require: false
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
