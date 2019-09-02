class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :category, :quantity, :avilable_quantity, :quantity_status

  def quantity_status
    return "Out of stock" if object.avilable_quantity.eql?(0)
    return "Avilable"
  end
  
end
