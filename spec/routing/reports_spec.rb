
require 'spec_helper'

describe 'manager' do
  describe 'Report' do

    it 'index' do
      expect( :get => '/manager/reports' ).to route_to( 'manager/reports#index' )
    end

    it 'without site' do
      expect( :get => '/manager/reports/without_site' ).to route_to( 'manager/reports#index', :site => false )
    end

    it 'edit' do
      expect( :get => '/manager/reports/some-id/edit' ).to route_to( 'manager/reports#edit', :id => 'some-id' )
    end

    it 'show' do
      expect( :get => '/manager/reports/id' ).to route_to( 'manager/reports#show', :id => 'id' )
    end

    it 'delete' do
      expect( :delete => '/manager/reports/id' ).to route_to( 'manager/reports#destroy', :id => 'id' )
    end
                                                                                       
  end
end


