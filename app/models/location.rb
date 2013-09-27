class Location < ActiveRecord::Base
  has_many :product_info_locationships
  has_many :product_infos, :through => :product_info_locationships

  has_many :price_logs
end
