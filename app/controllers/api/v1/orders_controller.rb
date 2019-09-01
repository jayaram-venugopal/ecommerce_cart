class Api::V1::OrdersController < ApplicationController

  def index
    
  end

  def add_to_cart
    @cart = 
  end

  def cart_details
    
  end

  private
  def cart_params
    params.require(:cart).permit(:product_id, :quantity)
  end

  def find_product
    @product = Product.find(params[:cart][:product_id])
    raise ActiveRecord::RecordNotFound if @product.nil?
  end
  
end
