
require 'spec_helper'

RSpec.describe Manager::SitesController, :type => :controller do

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
  end

  it 'index' do
    get :index
    response.should be_success
    assigns( :sites ).should_not eql nil
  end
  
  it 'trash' do
    get :trash
    response.should be_success
    sites = assigns( :sites )
    sites.should_not eql nil
    sites.length.should > 0
    sites.each do |s|
      s.is_trash.should eql true
    end
  end

  describe 'show' do
    it 'does' do
      get :show, :id => @site.id
      assigns( :site ).should_not eql nil
      assigns( :reports ).should_not eql nil
      assigns( :galleries ).should_not eql nil
      assigns( :videos ).should_not eql nil
    end
  end
  
  it 'newsitem_delete' do
    n = Newsitem.new({ :report_id => Report.all.first.id })
    @site.newsitems << n
    @site.save
    old_length = Site.find( @site.id ).newsitems.length
    delete :newsitem_delete, :site_id => @site.id, :newsitem_id => @site.newsitems[0].id
    result = Site.find( @site.id )
    result.newsitems.length.should eql old_length - 1
  end

  it 'edit' do
    get :edit, :id => @site.id
    response.should be_success
    response.should render_template( 'manager/sites/edit' )
  end
  
  it 'update' do
    old_n_features = @site.n_features
    old_n_features.should_not eql nil
    old_n_features.should_not eql 555
    @site.is_ads_enabled = false
    @site.is_private = false
    @site.save
    put :update, :id => @site.id, :site => { :n_features => 555, :n_newsitems => 666, :is_ads_enabled => true, :is_private => true }
    result = Site.find( @site.id )
    result.is_ads_enabled.should eql true
    result.is_private.should eql true
    result.n_features.should eql 555
    result.n_newsitems.should eql 666
  end

  it 'updates to trash' do
    @site.is_trash = false
    @site.save
    put :update, :id => @site.id, :site => { :is_trash => true }
    result = Site.unscoped.find( @site.id )
    result.is_trash.should eql true
  end

  it 'new' do
    get :new
    response.should be_success
  end

  it 'create' do
    Site.where( :domain => 'new-domain', :lang => 'en' ).length.should eql 0
    post :create, :site => { :domain => 'new-domain', :lang => 'en' }
    Site.where( :domain => 'new-domain', :lang => 'en' ).length.should eql 1
  end
  
end
