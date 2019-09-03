require 'rails_helper'

RSpec.describe Promotion::CartDiscount do

  context 'calculate total order for prodcut A,B,C' do
    data = [{:product_id =>  1, :quantity => 1}, {:product_id =>  2, :quantity => 1}, {:product_id =>  3, :quantity => 1}]
    let(:order) {build(:order, data.map { |p| build(:order_item, p) })}

    subject(:calculate) do
      Promotion::BasketDiscount.new(order).calculate 
    end
    
    it { expect(calculate[0]).to eq(100.0) }
  end

  context 'calculate total order for prodcut B,A,B,A,A' do
    order = FactoryBot.build(:order)
    data = [{:product_id =>  2, :quantity => 1}, {:product_id =>  1, :quantity => 1}, {:product_id =>  2, :quantity => 1}, {:product_id =>  1, :quantity => 1}, {:product_id =>  1, :quantity => 1}]
    order_items = data.map { |p| FactoryBot.create(:order_item, p) } 

    subject(:calculate) do
      Promotion::BasketDiscount.new(order).calculate 
    end
    
    it { expect(calculate[1]).to eq(110.0) }
  end
  

end