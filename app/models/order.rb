class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  
  enum status: {:open, :cart, :placed}
  validates :status, inclusion: { in: status.keys }
  
  before_save :update_order_total
  after_create :update_status

  private
  def update_order_total
    OrderDiscount.new(self)
  end

  def update_status
    self.cart!
  end
  
  
end
