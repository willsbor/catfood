class ProductInfo < ActiveRecord::Base
  belongs_to :category # 單數
  has_many :price_logs, :dependent => :destroy
end
