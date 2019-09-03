class Api::V1::OrdersController < ApplicationController
  include Api::V1::OrdersHelper

  before_action :find_products, only: [:create]
  before_action :set_order, only: [:show, :update, :place_order]
  before_action :validate_order_status, only: [:update, :place_order]
  before_action :validate_product_avilabe_quantity, only: [:update, :create]

  def create
    @cart = cart.create_cart
    return_respone(@cart)
  end

  def update
    @cart = Cart.new(order_params, @order).update_cart
    return_respone(@cart)
  end

  def place_order
    @order.update(:status => :placed)
    json_response(serializer(@order))
  end  
  
  def show
    json_response(serializer(@order))
  end

  private
  def order_params
    params.require(:order).permit(order_items: [:product_id, :quantity, :order_id])
  end

  def set_order
    @order ||= Order.find(params[:id])
  end  

  def cart
    Cart.new(order_params)
  end
end
