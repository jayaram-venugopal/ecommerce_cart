class AddToCart

  def initialize(params)
    @params = params
  end
    
  def create_cart
    
  end

  def create_order
    @order = Order.new
    @order_items = @order.orderitems.new(params[:order_items])
  end

  def method_name
    
  end
  
  
  
  
  
end

# params = {:order_items => [{:product_id => 1, quantity: 2}, {:product_id => 4, :quantity => 3}]}