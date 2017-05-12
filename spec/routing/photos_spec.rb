
require 'spec_helper'

describe 'manager' do
  describe 'Photos' do

    it 'without_gallery' do
      expect( :get => '/manager/photos/without_gallery' ).to route_to( 'manager/photos#without_gallery' )
    end

    it 'delete' do
      expect( :delete => '/manager/photos/some-id' ).to route_to( 'manager/photos#destroy', :id => 'some-id' )
    end

    it 'show' do
      expect( :get => '/manager/photos/some-id' ).to route_to( 'manager/photos#show', :id => 'some-id' )
    end
                                                                                       
  end
end


