require 'rails_helper'

RSpec.describe Promotion::ProductDiscount do

  context 'calculate product discount for ItemA' do
    let(:order_item) {build(:order_item, quantity: 3, product_id: 1)}

    subject(:calculate) do
       Promotion::ProductDiscount.new(order_item).calculate 
    end
    
    it { expect(calculate).to eq(75.0) }
  end

  context 'calculate product discount for ItemB' do
    let(:order_item) {build(:order_item, quantity: 2, product_id: 2)}

    subject(:calculate) do
       Promotion::ProductDiscount.new(order_item).calculate 
    end
    
    it { expect(calculate).to eq(35.0) }
  end

  context 'calculate product discount for ItemC' do
    let(:order_item) {build(:order_item, quantity: 1, product_id: 3)}

    subject(:calculate) do
       Promotion::ProductDiscount.new(order_item).calculate 
    end
    
    it { expect(calculate).to eq(50.0) }
  end

  context 'calculate product discount for ItemD' do
    let(:order_item) {build(:order_item, quantity: 1, product_id: 4)}

    subject(:calculate) do
       Promotion::ProductDiscount.new(order_item).calculate 
    end
    
    it { expect(calculate).to eq(15.0) }
  end
end