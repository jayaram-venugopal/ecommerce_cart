  class ProductDiscount
    attr_accessor :order_item, :product

    def initialize(order_item)
      @order_item = order_item
      @product = order_item.product
      @discount = 0
    end

    def call
      if product.a?
        category_a_product_discount
      elsif product.b? 
        category_b_product_discount
      elsif product.c? 
        category_c_product_discount
      elsif product.d? 
        category_d_product_discount
      end
      order_item.discount = @discount
      order_item.total = @total_price
    end
    
    private
    def category_a_product_discount
      number_of_group = order_quantity / 3
      number_of_ungroup = order_quantity % 3
      @discount = product_price - 5 unless number_of_group.eql?(0)
      @total_price = (number_of_group * 3 * (product_price - 5))
      @total_price += number_of_ungroup * product_price unless number_of_ungroup.eql?(0)
    end
    
    def category_b_product_discount
      number_of_group = order_quantity / 2
      number_of_ungroup = order_quantity % 2
      @discount = 5 unless number_of_group.eql?(0)
      @total_price = (number_of_group * 2 * product.price) - 5
      @total_price += number_of_ungroup * product.price unless number_of_ungroup.eql?(0)
    end

    def category_c_product_discount
      @total_price = (order_quantity * product_price)
    end

    def category_d_product_discount
      p product_price
      @total_price = (order_quantity * product_price)
    end

    def product_price
      product.price
    end

    def order_quantity
      order_item.quantity
    end
  end