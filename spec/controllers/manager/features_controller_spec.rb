
require 'spec_helper'

RSpec.describe Manager::FeaturesController, :type => :controller do

  render_views

  before :each do
    setup_users
    sign_in :user, @manager

    setup_sites
    @site.features << Feature.new({ :name => 'site feature' })
    @site.save

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
    @city.features << Feature.new({ :name => 'some feature name' })
    @city.save
    
    Gallery.all.each { |g| g.remove }
    @g = Gallery.create :name => 'a', :galleryname => 'bb', :user => User.all[0]
  end

  describe 'new/create' do
    it 'new for site' do
      get :new, :site_id => @site.id
      response.should be_success
    end

    it 'create for site' do
      n_old = @site.newsitems.length
      post :create, :site_id => @site.id, :feature => { :name => 'some new feature' }
      ( Site.find( @site.id ).newsitems.length - 1 ).should eql n_old
    end
  end

  describe 'edit/update' do
    it 'for site' do
      get :edit, :site_id => @site.id, :id => @site.features[0].id
      response.should be_success
    end

    it 'update for site' do
      @site.features.length.should > 0
      new_subhead = 'dfjkkkkk'
      patch :update, :feature => { :subhead => new_subhead }, :site_id => @site.id, :id => @site.features[0].id
      Site.find( @site.id ).features.find( @site.features[0].id ).subhead.should eql new_subhead
    end
  end
  
  describe 'city features' do
    
    it 'should GET new feature' do
      get :new, :city_id => @city.id
      response.should be_success
    end

    it 'POSTs new feature' do
      @city.features << Feature.new( :name => 'asdfasdfffffff' )
      @city.save

      post :create, :city_id => @city.id, :feature => { :name => 'test feature name yay' }
      response.should be_redirect
    end

    it 'GETs edit feature' do
      @city.features << Feature.new( :name => 'asdfasdfffffff' )
      @city.save
      
      get :edit, :city_id => @city.id, :id => @city.features[0].id
      response.should render_template('manager/features/edit')
    end

    it 'update for city' do
      @city.features.length.should > 0
      new_subhead = 'dfjkkkkk111'
      patch :update, :feature => { :subhead => new_subhead }, :city_id => @city.id, :id => @city.features[0].id
      City.find( @city.id ).features.find( @city.features[0].id ).subhead.should eql new_subhead
    end
    
  end

    
end
