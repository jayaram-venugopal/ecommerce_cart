class Api::V1::OrdersController < ApplicationController
  before_action :find_ptoducts, only: [:create]
  before_action :set_order, only: [:show, :update, :delete]

  def create
    @cart = AddToCart.new(params[:order]).create_order
  end

  def show
    json_response(serializer(@order))
  end

  private
  def set_order
    @order = Order.includes(order_items: (:product)).find(params[:id])
  end
  
  def serializer(data)
    OrderSerializer.new(data)
  end
end
