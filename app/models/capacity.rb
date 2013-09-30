class Capacity < ActiveRecord::Base
  belongs_to :sub_capacity, :class_name => "Capacity", :foreign_key => "sub_capacity_id"
  has_many :main_capacity, :class_name => "Capacity"

  has_many :price_logs

  has_many :product_info_capacityships
  has_many :product_infos, :through => :product_info_capacityships
end
