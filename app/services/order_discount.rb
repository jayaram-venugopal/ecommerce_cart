class OrderDiscount
  attr_accessor :order, :product

  def initialize(order)
    @order = order
    @discount = 0
  end
 
  def call
    orders_total
    order.subtotal = @sub_total
    order.grand_total = @grand_total
    order.discount = @discount
  end

  private
  def orders_total
    order_items_prices = order.order_items.map {|item| item.total} if order.order_items
    
    unless order_items_prices.empty?
      @sub_total = order_items_prices.compact.reduce(0, :+)

      @grand_total = @sub_total unless @sub_total >= 150
      
      if @sub_total >= 150
        @grand_total = (@sub_total - 20) 
        @discount = 20
      end
    end
  end

end