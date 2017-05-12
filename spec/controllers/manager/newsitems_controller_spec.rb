require 'spec_helper'
RSpec.describe Manager::NewsitemsController, :type => :controller do
  render_views
  before :each do
    setup_users
    sign_in :user, @manager

    setup_sites
    #it 'should create new newsitem' do
    #  old_n_newsitems = @city.newsitems.length
    #  ( old_n_newsitems > 0 ).should eql true
    #  newsitem = { :descr => 'newsiten new descr' }
    #  post :create_newsitem, :city_id => @city.id, :newsitem => newsitem
    #  response.should be_redirect
    #  new_n_newsitems = City.find( @city.id ).newsitems.length
    #  ( new_n_newsitems - 1 ).should eql old_n_newsitems
    #end

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

  describe "new" do
    it 'for site' do
      get :new, :site_id => @site.id
      response.should be_success
    end
    it 'for city' do
      get :new, :city_id => @city.id
      response.should be_success
    end
  end
    
  describe 'delete' do
    it 'for site' do
      @newsitem = Newsitem.new( :name => 'blahblah' )
      @site.newsitems.push @newsitem
      @site.save
      count = @site.newsitems.count

      delete :destroy, :site_id => @site.id, :id => @newsitem.id
      @site.reload
      expect { @site.newsitems.find( @newsitem.id ) }.to raise_error( Mongoid::Errors::DocumentNotFound )
    end
  end
end
