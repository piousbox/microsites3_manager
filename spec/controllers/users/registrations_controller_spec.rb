
require 'spec_helper'

describe Users::RegistrationsController do

  before :each do
    User.all.each { |u| u.remove }
    @user = FactoryGirl.create :user
    @manager = FactoryGirl.create :manager
    @piousbox = FactoryGirl.create :piousbox

    @request.env["devise.mapping"] = Devise.mappings[:user]

    setup_sites
  end

  # describe '' do
  #   it '#create' do
  #     # post :create, :user => { :email => 'manager2@gmail.com' }
  #     post :create, "user[email]" => 'manager2@gmail.com'      
  #     response.should be_redirect
  #   end
  # end

end
