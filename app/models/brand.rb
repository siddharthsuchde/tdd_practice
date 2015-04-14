class Brand < ActiveRecord::Base
  has_many :vendor_brands
  has_many :vendors, through: :vendor_brands
  validates_presence_of :name
  
  def self.search_for_brand(search)
    return [] if search.blank?
    where('name LIKE ?', "%#{search}%").order('name ASC')
  end
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |brand|
        csv << brand.attributes.values_at(*column_names)
      end 
    end
  end
end
