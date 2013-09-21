class PriceLogsController < ApplicationController

  def new
    @product_info = ProductInfo.find( params[:format] )
    @price_log = PriceLog.new
  end

  def create
    @product_info = ProductInfo.find( params[:format] )
    @price_log = PriceLog.new(price_logs_params)
    if @price_log.save
      flash[:notice] = "Successfully created..."

      @product_info.price_logs << @price_log
      redirect_to product_infos_path
    else
      render :action => :new
    end
  end

  def price_logs_params
    params.require(:price_log).permit(:price, :log_date, :location, :capacity, :cap_unit)
  end

end

