class CartDiscountSerializer < ActiveModel::Serializer
  attributes :id, :discount_price, :grand_total
end
