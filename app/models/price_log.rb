class PriceLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_info
  belongs_to :location
  belongs_to :capacity
end
