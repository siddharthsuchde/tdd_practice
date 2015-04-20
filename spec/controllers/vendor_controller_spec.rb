require 'spec_helper'

describe VendorsController do
  describe "GET#index" do
    it "lists the vendor names in alphabetical order" do
      brand = Fabricate(:brand)
      vendor1 = Fabricate(:vendor, name: "Bob")
      vendor2 = Fabricate(:vendor, name: "Alex")
      get :index
      expect(assigns(:vendors)).to match_array([vendor2, vendor1])
    end
  end
  
  describe "POST#create" do
    context "when vendor details are correctly entered" do
      it "creates a new vendor" do
        post :create, vendor: Fabricate.attributes_for(:vendor)
        expect(Vendor.count).to eq(1)
      end
      
      it "redirects to root path" do
        post :create, vendor: Fabricate.attributes_for(:vendor)
        expect(response).to redirect_to root_path
      end
      
      it "gives a success message" do
        post :create, vendor: Fabricate.attributes_for(:vendor)
        expect(flash[:success]).to be_present
      end
    end
    
    context "when vendor details are incorrectly entered" do
      it "gives an error message" do
        post :create, vendor: {name: "Sidd"}
        expect(flash[:error]).to be_present
      end
      
      it "renders a new vendor template" do 
        post :create, vendor: {name: "Sidd"}
        expect(response).to render_template(:new)
      end
      
      it "does not create a new user" do
        post :create, vendor: {name: "Sidd"}
        expect(Vendor.count).to eq(0)
      end
    end
  end
end