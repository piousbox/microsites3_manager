
require 'spec_helper'

describe 'routes of manager' do
  describe 'Feature in city' do

    it 'new' do
      expect( :get => 'manager/sites/some-id/features/new' ).to route_to( 'manager/features#new', :site_id => 'some-id' )
    end

    it 'create' do
      expect( :post => 'manager/sites/some-id/features' ).to route_to( 'manager/features#create', :site_id => 'some-id' )
    end

    it 'edit' do
      expect( :get => 'manager/sites/some-id/features/f-id/edit' ).to route_to( 'manager/features#edit', :site_id => 'some-id', :id => 'f-id' )
    end

    it 'update' do
      expect( :patch => 'manager/sites/some-id/features/f-id' ).to route_to( 'manager/features#update', :site_id => 'some-id', :id => 'f-id' )
    end
    
  end
end


