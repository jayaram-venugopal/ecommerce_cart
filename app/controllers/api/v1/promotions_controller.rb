class Api::V1::PromotionsController < ApplicationController
  before_action :set_product_promotion, only: [:update_product_promotion]
  before_action :set_cart_promotion, only: [:update_cart_promotion]

  def product_promotions
    json_response(serialize_array(ProductDiscount.all))
  end

  def cart_promotions
    json_response(serialize_array(CartDiscount.all))
  end  

  def create_product_promotion
    @product_promotion = ProductDiscount.create!(product_promotion_params)
    json_response(pro_serializer(@product_promotion), :create)
  end

  def update_product_promotion
    @product_promotion.update(product_promotion_params)
    json_response(pro_serializer(@product_promotion))
  end

  def create_cart_promotion
    @cart_promotion = CartDiscount.create!(cart_promotion_params)
    json_response(cart_serializer(@cart_promotion), :create)
  end

  def update_cart_promotion
    @cart_promotion.update(cart_promotion_params)
    json_response(cart_serializer(@cart_promotion))
  end

  private
  def product_promotion_params
    params.require(:product_discount).permit(:product_id, :discount_price, :no_of_products)
  end

  def cart_promotion_params
    params.require(:cart_discount).permit(:discount_price, :grand_total)
  end
  
  def set_product_promotion
    @product_promotion = ProductDiscount.find(params[:id])
  end
  
  def set_cart_promotion
    @cart_promotion = CartDiscount.find(params[:id])
  end 

  def pro_serializer(data)
    ProductDiscountSerializer.new(data)
  end

  def cart_serializer(data)
    CartDiscountSerializer.new(data)
  end
end
