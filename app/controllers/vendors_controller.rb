class VendorsController < ApplicationController
  
  def index
    @vendors = Vendor.all.order('name ASC')
    
    respond_to do |format|
      format.html
      format.csv { send_data @vendors.to_csv }
    end
  end
  
  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      flash[:success] = "Vendor was Successfully created"
      redirect_to root_path
    else
      flash[:error] = "Need to enter all relevant fields"
      render :new
    end
  end
  
  def edit
    @vendor = Vendor.find(params[:id])
  end
  
  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      flash[:notice] = 'Vendor Details Successfully Updated'
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def search
    @results = Vendor.search_for_vendor(params[:search])
  end
  
  
  private
  
  def vendor_params
    params.require(:vendor).permit(:name, :address, :phone, :email, brand_ids: [])
  end
  
  
  
end