class Users::PriceLogsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @price_logs = current_user.price_logs.page(params[:page]).per(5)
  end

  def new
    @page_title = "新的產品購買記錄"
    @price_log = PriceLog.new
  end

  def create
    #@product_info = ProductInfo.find( params[:format] )
    @price_log = PriceLog.new(price_logs_params)
    if @price_log.save
      flash[:notice] = "Successfully created..."

      current_user.price_logs << @price_log
      redirect_to users_price_logs_path
    else
      render :action => :new
    end
  end

  def price_logs_params
    params.require(:price_log).permit(:price, :log_date, :location, :capacity, :cap_unit, :product_info_id)
  end
end
