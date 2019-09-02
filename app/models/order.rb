class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  
  enum status: {open: "open", cart: "cart", placed: "placed"}
  validates :status, inclusion: { in: statuses.keys }
  
  before_save :update_order_total
  before_create :update_status_to_open
  after_create :update_status_to_cart

  private
  def update_order_total
    OrderDiscount.new(self).call
  end
  
  def update_status_to_open
    self.status = :open
  end
  
  def update_status_to_cart
    self.update(:status => :cart)
  end
  
  
end
