source 'https://rubygems.org'

gem 'rails', '4.0.8'

gem 'mongoid', '4.0.2'
gem 'mongoid_paranoia'
gem 'bson_ext'

gem 'sass-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
# gem 'coffee-filter'
# gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml'
gem 'html2haml'

gem 'paperclip', ['>= 3.4', '!= 4.3.0']
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'aws-sdk'
gem "aws-s3",            :require => "aws/s3"

gem 'unicorn'
gem 'jbuilder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'byebug'
end


gem 'activesupport'
gem "core_extensions"
gem 'kaminari'
gem 'tinymce-rails'
gem 'formtastic'
gem 'libv8'
gem 'therubyracer', :require => 'libv8'
gem 'nokogiri'
gem 'devise'
gem 'cancan'
gem 'kgio'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem "recaptcha", :require => "recaptcha/rails"
gem 'jquery-fileupload-rails'
gem 'passenger'
gem 'tzinfo'
gem 'eventmachine'

group :test do
  gem 'factory_girl_rails'
  gem 'rspec'  
  gem 'rspec-mocks'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'ruby-prof'
  gem 'simplecov', :require => false
end

group :development, :development_production, :test do
  gem 'net-ssh', '2.4.0'
  gem 'capybara'
  gem 'capistrano'
  gem 'quiet_assets'
  gem 'thin'
  gem 'delayed_job_mongoid'
  gem 'hpricot'
end

group :test, :development, :development_production, :util do
  gem 'simple-rss', :git => "git://github.com/piousbox/simple-rss.git"
  gem 'htmlentities' # need with simple-rss
  gem 'resque'
  gem 'minitest', '~> 4.7.5'
  gem 'test-unit'
end

group :assets, :development_production do
  gem 'sass'
  gem 'handlebars_assets'
end
