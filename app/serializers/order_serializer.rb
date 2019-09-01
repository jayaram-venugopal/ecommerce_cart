class OrderSerializer  < ActiveModel::Serializer
  attributes :id, :subtotal, :grand_total, :discount, :status

  has_many :order_items
end
