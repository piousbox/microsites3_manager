
require 'spec_helper'

RSpec.describe Manager::PhotosController, :type => :controller do

  render_views

  before :each do
    setup_users
    sign_in :user, @manager

    setup_sites

    @photo_without_gallery = Photo.new :user => @user
    @photo_without_gallery.save
    
    controller.request.stub referrer: 'http://example.com'
  end

  describe 'everything' do
    
    it 'photos without a gallery' do
      get :without_gallery
      response.should be_success
      response.should render_template('manager/photos/without_gallery')
      assigns( :photos ).should_not eql nil
      assigns( :photos ).length.should > 0
      assigns( :photos ).each do |ph|
        ph.gallery.should eql nil
      end
    end

    it 'delete' do
      delete :destroy, :id => @photo_without_gallery.id
      result = Photo.unscoped.find @photo_without_gallery.id
      result.is_trash.should eql true
    end

    it 'show' do
      get :show, :id => @photo_without_gallery.id
      response.should be_success
      response.should render_template('manager/photos/show')
      assigns( :photo ).should_not eql nil
    end
    
  end
  
end
