class OrderItem < ApplicationRecord
 
  belongs_to :product
  belongs_to :order
  
  after_save :update_product_avilable_quantity
  
  validates_with QuantityValidator
  
  def updata_quantity(quantity)
    self.quantity += quantity
    self.save
  end
  
  private
  def update_product_avilable_quantity
    quantity = (self.product.avilable_quantity - self.quantity)
    self.product.update(:avilable_quantity => quantity)
  end
  
end
