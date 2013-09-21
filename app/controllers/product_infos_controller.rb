class ProductInfosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_product_info, :only => [:destroy]

  def index
    @product_infos = ProductInfo.all
  end

  def new
    @product_info = ProductInfo.new
  end

  def create
    @product_info = ProductInfo.new(product_info_params)
    if @product_info.save
      flash[:notice] = "Successfully created..."
      redirect_to product_infos_path
    else
      render :action => :new
    end
  end

  def destroy
    @product_info.destroy

    flash[:alert] = "event was successfully deleted"
    redirect_to product_infos_path
  end

protected

  def find_product_info
    @product_info = ProductInfo.find(params[:id])
  end

  def product_info_params
    params.require(:product_info).permit(:vendor, :name, :category_id)
  end
end
