class VendorBrand < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :brand
end
