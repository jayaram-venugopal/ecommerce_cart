module Promotion
  class BasketDiscount
    attr_accessor :order, :product

    def initialize(order)
      @order = order
      @cart_discount = CartDiscount.last
    end
  
    def calculate
      orders_total
      return @sub_total, @grand_total
    end

    private
    def orders_total
      order_items_prices = order.order_items.map {|item| item.total} if order.order_items
      
      unless order_items_prices.empty?
        @sub_total = order_items_prices.compact.reduce(0, :+)
        update_grand_total
      end
    end

    def update_grand_total
      @grand_total = @sub_total
      if @sub_total >= cart_discount_grand_total
        @grand_total = (@sub_total - discount_price) 
        order.cart_discount_id = @cart_discount.id 
      end
    end

    def cart_discount_grand_total
      @cart_discount.grand_total
    end    

    def discount_price
      @cart_discount.discount_price
    end
    
  end
end