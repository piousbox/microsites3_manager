
require 'spec_helper'

RSpec.describe Manager::TagsController, :type => :controller do

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
    assigns( :tags ).should_not eql nil
  end

  describe 'show' do
    it 'does' do
      ;
    end
  end

  it 'delete' do
    ;
  end

  it 'new' do
    get :new
    response.should be_success
    response.should render_template 'manager/tags/new'
  end

  it 'create' do
    ;
  end

end
