class Product < ApplicationRecord  
  has_many :order_items, dependent: :destroy
  enum category: { a: "A", b: "B", c: "C", d: "D" }

  validates_presence_of :name, :quantity, :price, on: :create, message: "can't be blank"
  validates_uniqueness_of :name, on: :create, message: "must be unique"
  validates_numericality_of :quantity, on: :create, message: "is not a number"
  validates :category, inclusion: { in: categories.keys }
end
