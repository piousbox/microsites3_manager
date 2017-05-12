
require 'spec_helper'

RSpec.describe Manager::UsersController, :type => :controller do

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
    
  end

  describe 'index' do
    it 'does' do
      get :index
      response.should be_success
      assigns( :users ).should_not eql nil
    end
  end

  it 'show' do
    get :show, :id => @user.id
    response.should be_success
    response.should render_template 'manager/users/show'
    assigns( :user ).should_not eql nil
  end

end




