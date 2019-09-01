class Product < ApplicationRecord  
  validates_presence_of :name, :quantity, :price, on: :create, message: "can't be blank"
  validates_uniqueness_of :name, on: :create, message: "must be unique"
end
