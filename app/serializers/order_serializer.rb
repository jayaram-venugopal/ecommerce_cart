class OrderSerializer  < ActiveModel::Serializer
  attributes :id, :subtotal, :grand_total, :discount, :status

  has_many :order_items

  def subtotal
    "Rs. #{object.subtotal}"
  end

  def grand_total
    "Rs. #{object.grand_total}"
  end

  def discount
    "Rs. #{object.discount}"
  end
end
