class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :exit, :delete]
  
  def index
    @products = Product.all
    json_response(serialize_array(Product.all))
  end


  def show
    json_response(serializer(@product))
  end

  private
  
  def set_product
    @product = Product.find(params[:id])
  end

  def serializer(data)
    ProductSerializer.new(data)
  end
end
