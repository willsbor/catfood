class ProductInfoCapacityship < ActiveRecord::Base
  belongs_to :product_info
  belongs_to :capacity
end
