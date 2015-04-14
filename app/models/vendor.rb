class Vendor < ActiveRecord::Base
  has_many :vendor_brands
  has_many :brands, through: :vendor_brands
  validates_presence_of :name, :address, :email, :phone
  
  def self.search_for_vendor(search)
    return [] if search.blank?
    where( 'name LIKE ?', "%#{search}%").order('name ASC')
  end
  
  def self.to_csv( options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |vendor|
        csv << vendor.attributes.values_at(*column_names)
      end 
    end
  end
  
end