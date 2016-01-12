source 'https://rubygems.org'

gem 'rails', '4.0.8'
gem "core_extensions", "~> 0.0.4"
gem 'activesupport'
gem 'activeresource'

gem 'aws-sdk', '< 2.0'
gem "aws-s3",            :require => "aws/s3"

gem 'mongoid', '4.0.2'
gem 'mongoid-history'
gem 'bson'
gem "moped", github: "mongoid/moped"
gem 'mongoid_paranoia', :github => 'simi/mongoid-paranoia'
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'mongo_session_store-rails4'

gem 'paperclip', ['>= 3.4', '!= 4.3.0']
gem 'kaminari'
gem 'haml'
gem 'formtastic'
gem 'coffee-filter'
gem 'jquery-rails'
gem 'jbuilder'
gem 'libv8', '~> 3.11.8'
gem 'therubyracer', :require => 'libv8'
gem 'nokogiri', '~> 1.5.9'
gem 'devise'
gem 'cancan', '~> 1.5'
gem 'kgio', '~> 2.8.0'
gem 'bcrypt-ruby', '3.1.1.rc1', :require => 'bcrypt'
gem "recaptcha",         :require => "recaptcha/rails"
gem 'unicorn'
gem 'passenger'
gem 'tzinfo'
gem 'eventmachine'
gem 'newrelic_rpm'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'


group :development, :development_production, :test, :util do
  gem 'net-ssh', '2.4.0'
  gem 'capybara'
  gem 'quiet_assets'
  gem 'thin'
  gem 'delayed_job_mongoid'
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'rdoc'
  gem 'bundler'
  gem 'jeweler'
  gem 'rspec-rails'
  gem 'rspec'
  gem 'rspec-mocks'
  gem 'factory_girl_rails'  
  gem 'ruby-prof'
  gem 'simplecov', :require => false
  gem 'simple-rss', :git => "git://github.com/piousbox/simple-rss.git"
  gem 'htmlentities' # need with simple-rss
  gem 'resque'
  gem 'minitest', '~> 4.7.5'
end

group :assets do
  gem 'sass-rails',   '~> 4.0'
  gem 'sass'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'handlebars_assets'
end
