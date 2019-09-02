class OrderItemSerializer  < ActiveModel::Serializer
  attributes :id, :total, :discount, :quantity, :product 
  
  has_one :product

  def product
    ProductSerializer.new(object.product, { root: false } )
  end

  def total
    "Rs. #{object.total}"
  end

  def discount
    "Rs. #{object.discount}"
  end
  
end