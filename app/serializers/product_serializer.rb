class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :avilable_quantity, :quantity_status
  has_one :product_discount
  
  def quantity_status
    return "Out of stock" if object.avilable_quantity.eql?(0)
    return "Avilable"
  end
end
