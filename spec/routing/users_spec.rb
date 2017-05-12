
require 'spec_helper'

describe 'manager' do
  describe 'users' do

    it 'index' do
      expect( :get => '/manager/users' ).to route_to( 'manager/users#index' )
    end

    it 'show' do expect( :get => '/manager/users/id' ).to route_to 'manager/users#show', :id => 'id'
    end
    
  end
end


