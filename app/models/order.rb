class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  
  enum status: {open: "open", cart: "cart", placed: "placed"}
  
  validates_presence_of :subtotal, :grand_total, on: :create, message: "can't be blank"
  validates :status, inclusion: { in: statuses.keys }
  validates_numericality_of :subtotal, :grand_total, :greater_than_or_equal_to => 0.0, message: "greater than or equal to 0.0"
  
  before_create :update_status_to_cart

  private   
  def update_status_to_cart
    self.status = :cart
  end
    
end
