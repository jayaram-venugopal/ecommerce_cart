module Promotion
  class BasketDiscount
    attr_accessor :order, :product

    def initialize(order)
      @order = order
      @cart_discount = CartDiscount.last
    end
  
    def call
      orders_total
      order.subtotal = @sub_total
      order.grand_total = @grand_total
      order.cart_discount_id = @cart_discount.id
    end

    private
    def orders_total
      order_items_prices = order.order_items.map {|item| item.total} if order.order_items
      
      unless order_items_prices.empty?
        @sub_total = order_items_prices.compact.reduce(0, :+)
        upadte_grand_total
      end
    end

    def upadte_grand_total
      if @sub_total >= cart_discount_grand_total
        @grand_total = (@sub_total - discount_price) 
      else
        @grand_total = @sub_total
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