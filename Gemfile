source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

ruby "1.9.3"
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"
gem 'devise'
gem 'cancan'
gem "paperclip", "~> 3.0"
gem 'aws-sdk'
gem "rmagick"
gem "carrierwave", '0.9.0'
gem "nested_form"
gem "activerecord-postgresql-adapter"
gem 'axlsx'
gem 'axlsx_rails'
gem 'thin'
gem 'newrelic_rpm'

gem 'friendly_id', '~> 4.0.0'


group :production do
  # gem 'mysql'
  gem 'pg'
end
group :development do
  # gem 'mysql2'
  # gem "activerecord-mysql-adapter"
  gem 'pg'
end

group :test do
  # gem 'mysql2' 
  # gem "activerecord-mysql-adapter"
  gem 'pg'
  # gem 'cucumber-rails', :require => false
  gem 'cucumber-rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  # gem 'factory_girl', '2.3.2'
  gem "factory_girl_rails", ">= 4.2.0"
  gem "launchy", ">= 2.1.2"
  gem "email_spec", ">= 1.4.0"
  gem "capybara", ">= 2.0.2"
  gem "quiet_assets", ">= 1.0.1", :group => :development
  gem "figaro", ">= 0.5.3"
  gem "better_errors", ">= 0.3.2", :group => :development
  gem "binding_of_caller", ">= 0.6.8", :group => :development
  gem 'simplecov', :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'jquery-fileupload-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem "net-sftp", "~> 2.1.2"

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
#gem 'debugger'
