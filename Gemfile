source 'https://rubygems.org'

gem 'rails', '~> 5.0'
gem 'mongoid'
# gem 'bson_ext' # @TODO: don't I need this?
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'haml'
gem 'html2haml'
gem 'paperclip'
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'aws-sdk-v1'
gem 'aws-sdk', '~> 2'
gem "aws-s3", :require => "aws/s3"
gem 'unicorn'
gem 'jbuilder', '~> 2.4.0'
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
gem 'passenger'
gem 'tzinfo'
gem 'coffee-rails'

gem 'ish_models', :github => 'piousbox/ish_models', :branch => '0.0.8'

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
  gem 'net-ssh'
  gem 'capybara'
  gem 'capistrano'
  gem 'thin'
  gem 'hpricot'
  gem 'rspec-rails'
  gem 'byebug'
end

group :test, :development, :development_production, :util do
  gem 'simple-rss', :git => "git://github.com/piousbox/simple-rss.git"
  gem 'htmlentities'
  gem 'resque'
  gem 'minitest', '~> 5.1.0'
  gem 'test-unit'
end

group :assets, :development_production do
  gem 'sass'
  gem 'handlebars_assets'
end
