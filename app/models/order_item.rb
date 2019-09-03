class OrderItem < ApplicationRecord
 
  belongs_to :product
  belongs_to :order

  validates_presence_of :quantity, :total, on: :create, message: "can't be blank"
  validates_numericality_of :quantity, :greater_than_or_equal_to => 0, message: "greater than or equal to 0"
  validates_numericality_of :total, :greater_than_or_equal_to => 0.0, message: "greater than or equal to 0.0"
  
  before_save :update_discount_for_products
  after_save :update_discount_order_total
  
  def updata_quantity(quantity)
    self.quantity += quantity
  end  

  def update_product_avilable_quantity(quantity)
    product = self.product
    quantity = product.avilable_quantity - quantity
    product.update(:avilable_quantity => quantity)
  end

  private
  def update_discount_for_products
    self.total = Promotion::ProductDiscount.new(self).calculate
  end

  def update_discount_order_total
    order = self.order
    order.subtotal, order.grand_total = Promotion::BasketDiscount.new(order).calculate
  end
  
end
