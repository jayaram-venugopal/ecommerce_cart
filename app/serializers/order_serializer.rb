class OrderSerializer  < ActiveModel::Serializer
  attributes :id, :subtotal, :grand_total, :status, :cart_discount

  has_many :order_items
  has_one :cart_discount

  def subtotal
    "Rs. #{object.subtotal}"
  end

  def grand_total
    "Rs. #{object.grand_total}"
  end

  def discount
    "Rs. #{object.discount}"
  end

  def cart_discount
    cart_discount_id = object.cart_discount_id
    if cart_discount_id
      value = CartDiscount.find(cart_discount_id) 
      CartDiscountSerializer.new(value)
    end 
  end
  
end
