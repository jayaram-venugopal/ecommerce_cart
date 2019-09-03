class OrderItem < ApplicationRecord
 
  belongs_to :product
  belongs_to :order

  validates_presence_of :quantity, :total, on: :create, message: "can't be blank"
  validates_numericality_of :quantity, :greater_than_or_equal_to => 0, message: "greater than or equal to 0"
  validates_numericality_of :total, :greater_than_or_equal_to => 0.0, message: "greater than or equal to 0.0"
  
  before_save :update_discount_for_products
  after_save :update_discount_order_total
  after_create :update_product_avilable_quantity
  
  def updata_quantity(quantity)
    self.quantity += quantity
  end  

  private
  def update_product_avilable_quantity
    product = self.product
    quantity = product.avilable_quantity - self.quantity
    product.update(:avilable_quantity => quantity)
  end
  
  def update_discount_for_products
    Promotion::ProductDiscount.new(self).call
  end

  def update_discount_order_total
    Promotion::BasketDiscount.new(self.order).call
  end
  
end
