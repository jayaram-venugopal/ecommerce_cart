class Product < ApplicationRecord  
  has_many :order_items, dependent: :destroy
  has_one :product_discount

  after_create :update_avilabe_quantity
  
  validates_presence_of :name, :quantity, :price, on: :create, message: "can't be blank"
  validates_uniqueness_of :name, on: :create, message: "must be unique"
  validates_numericality_of :quantity, :avilable_quantity, :greater_than_or_equal_to => 0, message: "invalid number"
  
  private
  def update_avilabe_quantity
    self.update(:avilable_quantity => self.quantity)
  end
  
end
