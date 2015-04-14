require 'spec_helper'

describe BrandsController do
  describe "GET#index" do
    it "lists the brand names in alphabetical order" do
      brand1 = Fabricate(:brand, name: "bablolat")
      brand2 = Fabricate(:brand, name: "ashaway")
      get :index
      expect(Brand.all).to eq([brand2, brand1])
    end
  end
  
  describe "POST#create" do
    context "for valid entries" do
      it "creates a new brand" do
        post :create, brand: Fabricate.attributes_for(:brand)
        expect(Brand.count).to eq(1)
      end
      
      it "redirects to the Brand Index page" do
        post :create, brand: Fabricate.attributes_for(:brand)
        expect(response).to redirect_to brands_path
      end
      
      it "gives a success message" do
        post :create, brand: Fabricate.attributes_for(:brand)
        expect(flash[:success]).to be_present
      end
    end
    
    context "for invalid entries" do
      it "does not create a new brand" do
        post :create, brand: { name: "" }
        expect(Brand.count).to eq(0)
      end
      
      it "renders the new brand page" do
        post :create, brand: { name: ""}
        expect(response).to render_template(:new)
      end
      
      it "gives an error message" do
        post :create, brand: { name: ""}
        expect(flash[:error]).to be_present
      end
    end
  end
  
  
end