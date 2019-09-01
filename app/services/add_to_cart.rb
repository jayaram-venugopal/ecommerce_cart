class AddToCart
  attr_accessor :params

  def initialize(params)
    @params = params
    @error = []
  end

  def create_cart
    create_order
    json_response(@order) if @error.empty?
    error_response(error_response) unless @error.empty?
  end

  def create_order
    @order = Order.new 
    @order_items = @order.order_items.new(order_item_params["order_items"])
    p @order_items
    @order_items.each {|item| ProductDiscount.new(item).call }
    unless @order.save && @order_items.each(&:save)
      @error.push(@order_items.errors.full_messages) if @order_items.errors
      @error.push(@order.errors.full_messages) if @order.errors 
    end
  end

  private
  def order_item_params
    params.permit(order_items: [:product_id, :quantity, :order_id])
  end
  

  def error_response
    Errors::StandardError.new("Failed to Add to cart", @eeror.flatten.uniq, 422)
  end
  
  
end 