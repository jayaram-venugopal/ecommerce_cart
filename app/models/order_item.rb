class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :update_total_price

  def update_total_price
    DiscountCalculatore.new(self)
  end
  
end
