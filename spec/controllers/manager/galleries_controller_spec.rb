
require 'spec_helper'

RSpec.describe Manager::GalleriesController, :type => :controller do

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
    response.should be_redirect
    response.should redirect_to manager_galleries_thumb_path
  end

  describe 'index_title', :index_title => true do
    before :each do
      %w( one two three ).each do |i|
        Gallery.create :name => i, :user => @manager, :site => @site
      end
      @private_gallery = Gallery.create :name => 'non-public gallery', :is_public => false, :user => @manager, :site => @site
    end

    it 'does' do
      get :index_title
      @galleries = assigns :galleries      

      response.should be_success
      @galleries.should_not eql nil
    end

    it 'sorts galleries by creation time' do
      get :index_title
      @galleries = assigns :galleries      

      @galleries.each_with_index do |gallery, idx|
        if idx+1 != @galleries.length
          @galleries[idx].created_at.should > @galleries[idx+1].created_at
        end
      end
    end

    it 'displays private galleries' do
      Gallery.unscoped.where( :is_public => false ).length.should > 0

      get :index_title
      @galleries = assigns :galleries      
      
      flag = false
      @galleries.each do |gallery|
        if !gallery.is_public
          flag = true
        end
      end
      flag.should eql true
    end

    it 'does not display trash galleries' do
      Gallery.create :name => 'trash gallery', :user => @manager, :is_trash => true, :site => @site
      Gallery.unscoped.where( :is_trash => true ).length.should > 0
      get :index_title
      assigns( :galleries ).select { |g| g.is_trash }.length.should eql 0      
    end
  end


  it 'index_mini' do
    get :index_mini
    response.should be_success
    assigns( :galleries ).should_not eql nil
  end

  it 'index_thumb' do
    get :index_thumb
    response.should be_success
    assigns( :galleries ).should_not eql nil
  end

  describe 'show' do
    it 'does' do
      get :show, :id => @gallery.id
      response.should be_success
      assigns( :gallery ).should_not eql nil
    end

    it 'shows private' do
      gallery = Gallery.create :name => 'new-private-gallery', :user => @manager, :is_public => false, :site => @site
      get :show, :id => gallery.id
      response.should be_success
      this_gallery = assigns( :gallery )
      this_gallery.is_public.should eql false
    end
  end

  it 'delete' do
    @gallery.is_trash.should eql false
    delete :destroy, :id => @gallery.id
    g = Gallery.unscoped.find( @gallery.id )
    g.is_trash.should eql true
  end

end
