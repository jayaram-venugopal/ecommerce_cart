class CartDiscount < ApplicationRecord
  has_many :orders

  validates_presence_of :discount_price, :grand_total, on: :create, message: "can't be blank"
  validates_numericality_of :discount_price, :grand_total, :greater_than_or_equal_to => 0.0, message: "greater than or equal to 0.0"
end
