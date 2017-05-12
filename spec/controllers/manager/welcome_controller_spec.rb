
require 'spec_helper'

RSpec.describe Manager::WelcomeController, :type => :controller do

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
  end

  it 'home' do
    get :home
    response.should be_success
  end
end




