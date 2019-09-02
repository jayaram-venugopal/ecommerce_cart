class QuantityValidator < ActiveModel::Validator
  
  def validate(record)
    if record.quantity > record.product.avilable_quantity 
      record.errors.add(:quantity, "#{record.product.name} out of stock")
    end
  end
end