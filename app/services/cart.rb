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
    create_order_items(params[:order_items])
    unless @order.save
      order_items_errors
      order_errors
    end
  end

  def create_order_items(item_params)
    @order_items = @order.order_items.new(item_params)
    update_discount_for_products
  end  

  def update_or_create_order_cart
    @new_records = []
    params[:order_items].each do |item|
      updat_order_cart(item)
    end
    unless @new_records.empty?
      create_order_items(@new_records) 
      order_items_errors unless @order_items.each(&:save)
    end
  end

  def updat_order_cart(item)
    @order_items = find_order_items(item[:product_id])
    if @order_items
      update_order_items(item[:quantity])
      order_item_error 
    else
      @new_records.push(item)
    end
  end
  

  private
  def update_order_items(quantity)
    @order_items.updata_quantity(quantity)
  end

  def update_discount_for_products
    @order_items.each {|item| Promotion::ProductDiscount.new(item).call }
  end  

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

  def find_order_items(product_id)
    @order.order_items.find_by(product_id: product_id)
  end    
end 