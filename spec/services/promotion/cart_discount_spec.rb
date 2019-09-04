require 'rails_helper'

RSpec.describe Promotion::CartDiscount do

  it 'calculate total order for prodcut A,B,C' do
    @order = create(:order)
    data = [{:product_id =>  1, :quantity => 1}, {:product_id =>  2, :quantity => 1}, {:product_id =>  3, :quantity => 1}]
    order_items = data.map { |p| create(:order_item, :product_id => p[:product_id], :quantity => p[:quantity], :order_id => @order.id) }
    calculate = Promotion::BasketDiscount.new(@order).calculate 
    
    expect(calculate[1]).to match(100.0)
  end

  it 'calculate total order for prodcut B,A,B,A,A' do
    @order = create(:order)
    data = [{:product_id =>  2, :quantity => 2}, {:product_id =>  1, :quantity => 3}]
    order_items = data.map { |p| create(:order_item, :product_id => p[:product_id], :quantity => p[:quantity], :order_id => @order.id) }
    calculate = Promotion::BasketDiscount.new(@order).calculate 
    
    expect(calculate[1]).to match(110.0)
  end

  it 'calculate total order for prodcut C, B, A, A, D, A, B' do
    @order = create(:order)
    data = [{:product_id =>  1, :quantity => 3}, {:product_id =>  2, :quantity => 2}, {:product_id =>  3, :quantity => 1}, {:product_id =>  4, :quantity => 1}]
    order_items = data.map { |p| create(:order_item, :product_id => p[:product_id], :quantity => p[:quantity], :order_id => @order.id) }
    calculate = Promotion::BasketDiscount.new(@order).calculate 
    
    expect(calculate[1]).to match(155.0)
  end

  it 'calculate total order for prodcut C, A, D, A , A' do
    @order = create(:order)
    data = [{:product_id =>  1, :quantity => 3}, {:product_id =>  3, :quantity => 1}, {:product_id =>  4, :quantity => 1}]
    order_items = data.map { |p| create(:order_item, :product_id => p[:product_id], :quantity => p[:quantity], :order_id => @order.id) }
    calculate = Promotion::BasketDiscount.new(@order).calculate 
    
    expect(calculate[1]).to match(140.0)
  end
  

end