
require 'spec_helper'

describe 'manager' do
  describe 'cities' do

    it 'index' do
      expect( :get => '/manager/cities' ).to route_to( 'manager/cities#index' )
    end

    it 'show' do
      expect( :get => '/manager/cities/some-name' ).to route_to( 'manager/cities#show', :id => 'some-name' )
    end

    it 'new city feature' do
      expect( :get => '/manager/cities/name/features/new' ).to route_to( 'manager/features#new', :city_id => 'name' )
    end
                                                                                       
  end
end


