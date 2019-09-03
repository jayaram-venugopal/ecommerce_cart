class ProductDiscount < ApplicationRecord
  belongs_to :product

  validates_presence_of :discount_price, :no_of_products, on: :create, message: "can't be blank"
  validates_numericality_of :discount_price, :greater_than_or_equal_to => 0.0, message: "greater than or equal to 0.0"
  validates_numericality_of :no_of_products, :greater_than_or_equal_to => 0, message: "greater than or equal to 0"
end
