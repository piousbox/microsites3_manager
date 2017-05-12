
require 'spec_helper'

describe Users::SessionsController do

  before :each do
    User.all.each { |u| u.remove }
    @user = FactoryGirl.create :user
    @manager = FactoryGirl.create :manager
    @piousbox = FactoryGirl.create :piousbox

    @request.env["devise.mapping"] = Devise.mappings[:user]

    setup_sites
  end

  describe 'everything' do
    it '#create' do
      post :create, :user => { :email => 'manager2@gmail.com' }
      flash[:alert].should eql 'Invalid username or password.'
      response.should be_redirect
    end
  end

end
