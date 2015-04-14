class CreateVendorBrands < ActiveRecord::Migration
  def change
    create_table :vendor_brands do |t|
      t.integer :vendor_id
      t.integer :brand_id
      
      t.timestamps
    end
  end
end
