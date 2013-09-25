class PriceLogsController < ApplicationController

  def index
    @price_logs = PriceLog.page(params[:page]).per(5)
  end

  def show
    @price_log = PriceLog.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

end

