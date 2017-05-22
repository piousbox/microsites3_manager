require 'simplecov'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'capybara/rails'
require 'capybara/rspec'

require 'test/unit'

require 'devise'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

include Warden::Test::Helpers # devise here

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
  
  config.include Devise::Test::ControllerHelpers, :type => :controller

  config.around( :each, :caching ) do |example|
    caching = ActionController::Base.perform_caching
    ActionController::Base.perform_caching = example.metadata[:caching]
    example.run
    Rails.cache.clear
    ActionController::Base.perform_caching = caching
  end

  config.infer_spec_type_from_file_location!

end

Paperclip.options[:log] = false

def puts! args, label=""
  puts "+++ +++ #{label}"
  puts args.inspect
end

class ActionController::TestCase
  Paperclip.options[:log] = false
end

class Report
  def self.clear
    if Rails.env.test?
      self.each { |r| r.remove }
    end
  end
end

class User
  def self.clear
    if Rails.env.test?
      User.all.each { |r| r.remove }
    end
  end
end

def setup_galleries
  Gallery.clear
  @gallery = FactoryGirl.create :gallery
end

def setup_users
  User.unscoped.each { |c| c.remove }
  @user = FactoryGirl.create :user
  @anon = FactoryGirl.create :anon
  @simple = FactoryGirl.create :simple
  @user_2 = FactoryGirl.create :user_2
  @manager = FactoryGirl.create :manager
  @piousbox = FactoryGirl.create :piousbox
end

def setup_sites
  @request ||= FakeRequest.new
  Site.all.each { |s| s.remove }
  @site = FactoryGirl.create :site
  @site_ru = FactoryGirl.create :site_ru
  @site_pt = FactoryGirl.create :site_pt
  @request.host = 'piousbox.com'
end

class FakeRequest
  attr_accessor :host
end
