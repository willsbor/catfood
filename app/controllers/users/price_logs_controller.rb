class Users::PriceLogsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @price_logs = current_user.price_logs.page(params[:page]).per(5)
  end

  def product_info_logs
    @price_logs_for_product_info = PriceLog.joins(:product_info).where(:user_id => current_user.id, :product_info_id => params[:id])

    respond_to do |format|
      format.js
    end
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

protected
  def price_logs_params
    params.require(:price_log).permit(:price, :log_date, :location, :capacity, :cap_unit, :product_info_id)
  end
end
