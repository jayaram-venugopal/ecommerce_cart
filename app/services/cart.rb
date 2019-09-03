class Cart
  attr_accessor :params

  def initialize(params, order = nil)
    @params = params
    @order = order
    @error = []
  end

  def create_or_update_cart
    @order = Order.new if @order.nil? 
    update_or_create_order_cart
    return @order if @error.empty?
    return error_message unless @error.empty?
  end

  def update_or_create_order_cart
    new_params.each do |item|
      @order_item = find_or_initialize_by_order_items(item[:product_id])
      @order_item.updata_quantity(item[:quantity])
      @order_item.update_product_avilable_quantity(item[:quantity])
      unless @order.save!
        order_item_error
        order_errors
      end
    end
  end

  private
  def new_params
    new_params = []
    product_ids = params["order_items"].map { |value| value["product_id"]}.uniq
    product_ids.each do |id|
      quantity = params[:order_items].select {|a| a[:product_id] == id}.pluck(:quantity).compact.reduce(0, :+)
      new_params.push({:product_id => id, :quantity => quantity})
    end
    new_params
  end
  
  def order_item_error
    @error.push(@order_item.errors.full_messages)
  end
  
  def order_errors
    @error.push(@order.errors.full_messages)
  end

  def error_message
    error_message = Errors::StandardError.new("Failed to Add to cart", @error.flatten.uniq, 422)
    ErrorSerializer.new(error_message)
  end

  def find_or_initialize_by_order_items(product_id)
    @order.order_items.includes(:product).find_or_initialize_by(product_id: product_id)
  end    
end 