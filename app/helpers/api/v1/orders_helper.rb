module Api::V1::OrdersHelper

  def find_products
    order_products = params.dig(:order, :order_items)
    product_ids = order_products.map { |value| value[:product_id]}
    products = Product.where(:id => product_ids)
    raise ActiveRecord::RecordNotFound unless products.count.eql?(order_products.count)
  end

  def validate_product_avilabe_quantity
    error = []
    order_params = params[:order][:order_items]
    order_params.each do |params|
      @product = Product.find(params[:product_id])
      error.push("#{@product.name} out of stock") unless @product.avilable_quantity >= params[:quantity]
    end
    render_error_order_status("Out of Stock", error, 422) unless error.empty?
  end

  def validate_order_status
    render_error_order_status("Order status", "Order is already placed", 422) if @order.placed?
  end
  
  def serializer(data)
    OrderSerializer.new(data)
  end
  
  def render_error_order_status(message, data, status)
    error_message = Errors::StandardError.new(message, data, status)
    error_serializer = ErrorSerializer.new(error_message)
    error_response(error_serializer, :unprocessable_entity) 
  end

  def return_respone(data)
    json_response(serializer(data)) unless data.class.name.eql?("ErrorSerializer")
    error_response(data, :unprocessable_entity) if data.class.name.eql?("ErrorSerializer")
  end

end
