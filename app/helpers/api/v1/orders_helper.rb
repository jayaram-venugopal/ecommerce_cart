module Api::V1::OrdersHelper

  def find_products
    order_products = params.dig(:order, :order_items)
    product_ids = order_products.map { |value| value[:product_id]}
    products = Product.where(:id => product_ids)
    raise ActiveRecord::RecordNotFound unless products.count.eql?(order_products.count)
  end

  def return_respone(data)
    json_response(serializer(data)) unless data.class.name.eql?("ErrorSerializer")
    error_response(data, :unprocessable_entity) if data.class.name.eql?("ErrorSerializer")
  end

  def validate_order_status
    error_message = Errors::StandardError.new("Order status", "Order is already placed", 422)
    error_serializer = ErrorSerializer.new(error_message)
    error_response(error_serializer, :unprocessable_entity) if @order.placed?
  end
  
  def serializer(data)
    OrderSerializer.new(data)
  end
end
