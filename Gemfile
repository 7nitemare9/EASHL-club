source 'http://rubygems.org'

gem 'rails', '~>4.0.0'
gem 'nokogiri'
gem 'rest-client'
gem 'cells'
gem 'jquery-rails'
gem 'thin'
gem 'phpbb-auth', :git => 'https://github.com/7nitemare9/phpbb-auth.git'
gem 'mysql2'
gem 'kaminari'
#gem 'taps'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
 # gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
  gem "scrapi", "~> 2.0.0"

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'capybara', '>= 2.2.0'
  gem "sinatra"
  gem "webmock", :require => false
end

end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
gem 'therubyracer'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'
