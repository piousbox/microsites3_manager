
require 'spec_helper'

RSpec.describe Manager::CitiesController, :type => :controller do

  render_views

  before :each do
    setup_users
    sign_in :user, @manager

    setup_sites

    Report.all.each { |c| c.remove }
    @r1 = FactoryGirl.create :r1
    @r1.user = @user
    @r1.save
    @r9 = FactoryGirl.create :r9
    Report.all.each do |report|
      report.site = @site
      report.save
    end

    Gallery.unscoped.each do |gallery|
      gallery.remove
    end
    @gallery = Gallery.create :name => 'some-gallery-name', :user => @manager, :site => @site
    flag = @gallery.save
    puts! @gallery.errors unless flag
    flag.should eql true

    Tag.all.each { |c| c.remove }
    
    City.all.each { |c| c.remove }
    @city = FactoryGirl.create :rio
    n = Newsitem.new :descr => 'first newsitem' 
    @city.newsitems << n
    
    Gallery.all.each { |g| g.remove }
    @g = Gallery.create :name => 'a', :galleryname => 'bb', :user => User.all[0]
  end

  it 'index' do
    get :index
    response.should be_success
    assigns( :cities ).should_not eql nil
  end

  describe 'new' do
    it 'should GET new' do
      get :new, :locale => :en
      response.should be_success
    end
  end

  it 'create' do
    ;
  end

  describe 'show' do
    it 'should have n_reports, n_galleries' do
      get :show, :id => @city.id
      response.should be_success
      response.should render_template('manager/cities/show')
    end
  end

end
