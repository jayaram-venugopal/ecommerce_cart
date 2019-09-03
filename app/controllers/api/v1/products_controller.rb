class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :delete]
  
  def index
    json_response(serialize_array(Product.all))
  end

  def show
    json_response(serializer(@product))
  end

  def create
    @product = Product.create!(product_params)
    json_response(serializer(@product), :create)
  end

  def update
    @product.update(product_params)
    json_response(serializer(@product))
  end  

  private
  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def serializer(data)
    ProductSerializer.new(data)
  end
end
