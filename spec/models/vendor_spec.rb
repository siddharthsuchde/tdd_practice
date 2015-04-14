require 'spec_helper'

describe Vendor do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:address)}
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:phone)}
  it { should have_many(:brands).through(:vendor_brands) }
  
  describe 'search_for_vendor' do
    it 'returns an empty array when there is no match' do
      pioneer = Fabricate(:vendor, name: 'pioneer')
      expect(Vendor.search_for_vendor('caxton')).to eq([])
    end
    
    it 'returns array of one when there is an exact match' do
      pioneer = Fabricate(:vendor, name: 'pioneer')
      expect(Vendor.search_for_vendor('pioneer')).to eq([pioneer])
    end
    
    it 'returns an ordered array by name when there is a partial match' do
      pioneer = Fabricate(:vendor, name: 'pioneer')
      btsports = Fabricate(:vendor, name: 'btsports')
      acsports = Fabricate(:vendor, name: 'acsports')
      expect(Vendor.search_for_vendor('orts')).to eq([acsports, btsports])
    end
    
    it 'returns an empty array for search with empty string' do
      pioneer = Fabricate(:vendor, name: 'pioneer')
      expect(Vendor.search_for_vendor('')).to eq([])
    end
    
  end
  
  
end
