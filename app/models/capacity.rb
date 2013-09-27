class Capacity < ActiveRecord::Base
  has_many :price_logs

  has_many :product_info_capacityships
  has_many :product_infos, :through => :product_info_capacityships
end
