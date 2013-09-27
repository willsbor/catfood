class ProductInfoLocationship < ActiveRecord::Base
  belongs_to :product_info
  belongs_to :location
end
