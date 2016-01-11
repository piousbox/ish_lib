#
# ish_lib gemfile
#
source 'https://rubygems.org'


gem 'aws-sdk'
gem "aws-s3",            :require => "aws/s3"
gem "bcrypt-ruby", :require => "bcrypt"
gem 'cancan', '~> 1.5'
gem 'coffee-filter'
gem 'devise'
gem 'execjs'
gem 'haml'
gem 'htmlentities'
gem 'jwt'
gem 'kaminari'
gem 'mongoid'
# gem 'mysql2', '~> 0.3.0'
gem 'jquery-fileupload-rails'
gem 'jquery-rails'
gem 'libv8', '~> 3.11.8'
gem 'nokogiri', '~> 1.5.9'
gem 'paperclip'          # , '0.0.9' # dunno why the obsolete version. _vp_ 20160110
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'rails', '~> 3.2.3'
gem "recaptcha",         :require => "recaptcha/rails"
gem 'tinymce-rails'
gem 'therubyracer', :require => 'libv8'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :utils do
  gem "resque"
  gem 'simple-rss', :git => "git://github.com/piousbox/simple-rss.git"
end

group :production do
  gem 'unicorn'
  # gem 'passenger'
end

group :test do
  gem 'factory_girl_rails'
  gem 'minitest'
  gem 'mocha'
  gem 'rspec-rails-mocha', '~> 0.3.1'
  gem 'shoulda'
  gem 'rspec-rails'
  gem 'rspec'
  gem 'shoulda-matchers'
  gem 'ruby-prof'
end

group :development, :test do
  gem 'net-ssh', '2.4.0'
  gem 'capybara'
  gem 'capistrano'
  gem 'quiet_assets'
  gem 'thin'
  gem 'delayed_job_mongoid'
  gem 'hpricot'
  gem 'simplecov', :require => false
end
