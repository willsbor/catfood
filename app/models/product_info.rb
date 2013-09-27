class ProductInfo < ActiveRecord::Base
  belongs_to :category # 單數
  has_many :price_logs
  has_many :product_info_locationships
  has_many :locations, :through => :product_info_locationships
  has_many :product_info_capacityships
  has_many :capacities, :through => :product_info_capacityships
end
