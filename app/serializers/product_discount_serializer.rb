class ProductDiscountSerializer < ActiveModel::Serializer
  attributes :id, :no_of_products, :discount_price
  has_one :product
  
end
