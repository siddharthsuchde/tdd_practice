require 'spec_helper'

describe Brand do
  it { should have_many(:vendors).through(:vendor_brands)}
  
  describe 'search_for_brand' do
    it 'returns an empty array for a non matching search term' do
      yonex = Fabricate(:brand, name: 'yonex')
      expect(Brand.search_for_brand('head')).to eq([])
    end
    
    it 'returns an array of one for an exact match search term' do
      yonex = Fabricate(:brand, name: 'yonex')
      expect(Brand.search_for_brand('yonex')).to eq([yonex])
    end
    
    it 'returns an array ordered by name for a partial match' do
      yonex = Fabricate(:brand, name: 'yonex')
      head = Fabricate(:brand, name: 'head')
      wilson = Fabricate(:brand, name: 'wilson')
      expect(Brand.search_for_brand('on')).to eq([wilson, yonex])
    end
    it 'returns an empty array for a empty string' do 
      yonex = Fabricate(:brand, name: 'yonex')
      expect(Brand.search_for_brand('')).to eq([])
    end
    
  end
  
end
