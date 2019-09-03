class Cart
  attr_accessor :params

  def initialize(params, order = nil)
    @params = params
    @order = order if order.present?
    @error = []
  end

  def create_cart
    create_order
    return @order if @error.empty?
    return error_message unless @error.empty?
  end

  def update_cart
    update_or_create_order_cart
    return @order if @error.empty?
    return error_message unless @error.empty?
  end
  
  def create_order
    @order = Order.new 
    @order_items = @order.order_items.new(params[:order_items])
    unless @order.save!
      order_items_errors
      order_errors
    end
  end

  def update_or_create_order_cart
    params[:order_items].each do |item|
      @order_item = find_or_initialize_by_order_items(item[:product_id])
      @order_item.updata_quantity(item[:quantity])
      update_product_avilable_quantity(item[:quantity])
      order_item_error unless @order_item.save && @product.save
    end
  end

  private
  def order_items_errors
    @order_items.each {|item| @error.push(item.errors.full_messages)} 
  end
  
  def order_errors
    @error.push(@order.errors.full_messages)
  end
  
  def order_item_error
    @error.push(@order_items.errors.full_messages)
  end
  
  def error_message
    error_message = Errors::StandardError.new("Failed to Add to cart", @error.flatten.uniq, 422)
    ErrorSerializer.new(error_message)
  end

  def update_product_avilable_quantity(quantity)
    @product = @order_item.product
    quantity = @product.avilable_quantity - quantity
    @product.avilable_quantity = quantity
  end

  def find_or_initialize_by_order_items(product_id)
    @order.order_items.includes(:product).find_or_initialize_by(product_id: product_id)
  end    
end 