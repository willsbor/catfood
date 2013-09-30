class PriceLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_info
  belongs_to :location
  belongs_to :capacity

  validates_presence_of :price, :log_date, :product_info_id, :location_id, :capacity_id, :amount

  before_save :calculate_total
  protected
  def calculate_total
    self.total = self.amount * self.price
  end
end
