
require 'spec_helper'

describe 'routes of manager' do
  describe 'Site' do

    it 'reports in site' do
      expect( :get => '/manager/sites/site-id/reports' ).to route_to( 'manager/reports#index', :site_id => 'site-id' )
    end
    
    it 'index' do
      expect( :get => '/manager/sites' ).to route_to( 'manager/sites#index' )
    end

    it 'newsitem_delete' do
      expect( :delete => 'manager/sites/site-id/newsitems/newsitem-id'
            ).to route_to( 'manager/newsitems#destroy', :site_id => 'site-id', :id => 'newsitem-id' )
    end

    it 'edit' do
      expect( :get => 'manager/sites/some-id/edit' ).to route_to( 'manager/sites#edit', :id => 'some-id' )
    end

    it 'update' do
      expect( :put => 'manager/sites/some-id' ).to route_to( 'manager/sites#update', :id => 'some-id' )
    end

    it 'trash' do
      expect( :get => 'manager/sites/trash' ).to route_to( 'manager/sites#trash' )
    end
    
  end
end


