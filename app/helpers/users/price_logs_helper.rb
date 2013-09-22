module Users::PriceLogsHelper
  def product_info_options
    ProductInfo.all.map{ |c| [c.vendor + ' ' + c.name + '(' + c.category.try(:name) + ')', c.id] }
  end
end
