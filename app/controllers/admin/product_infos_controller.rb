class Admin::ProductInfosController < ApplicationController
  before_filter :authenticate

  def index
    @product_infos = ProductInfo.all
  end

  protected
    def authenticate
       authenticate_or_request_with_http_basic do |user_name, password|
           user_name == "username" && password == "password"
       end
    end
end
