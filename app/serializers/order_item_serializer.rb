class OrderItemSerializer  < ActiveModel::Serializer
  attributes :id, :total, :quantity 
  
  belongs_to :product
end