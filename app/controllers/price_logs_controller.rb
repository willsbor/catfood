class PriceLogsController < ApplicationController

  def index
    @price_logs = PriceLog.page(params[:page]).per(5)
  end

end

