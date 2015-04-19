class BrandsController < ApplicationController
  
  def index
    @brands = Brand.all.order('name ASC')
    
    respond_to do |format|
      format.html
      format.csv { send_data @brands.to_csv }
    end
    
  end
  
  def new
    @brand = Brand.new
  end
  
  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:success] = 'Your Brand Was Successfully Created'
      redirect_to brands_path
    else
      flash[:error] = "Need to Enter a Brand Name"
      render :new
    end
  end
  
  def edit
    @brand = Brand.find(params[:id])
  end
  
  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      flash[:success] = "Brand Details Were Successfully Updated"
      redirect_to brands_path
    else
      render :edit
    end
  end
  
  def search
    @results = Brand.search_for_brand(params[:search])
  end
  
  
  private
  
  def brand_params
    params.require(:brand).permit(:name)
  end
  
  
  
end
