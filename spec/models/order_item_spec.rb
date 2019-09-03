require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before(:all) do
    @order_item1 = create(:order_item)
  end

  it "is valid with valid attributes" do
    expect(@order_item1).to be_valid
  end

  it "is not valid without a product_id" do
    order_item2 = build(:order_item, product_id: nil)
    expect(order_item2).to_not be_valid
  end

  it "is not valid without a order_id" do
    order_item2 = build(:order_item, order_id: nil)
    expect(order_item2).to_not be_valid
  end
  
  it "is not valid without a total" do
    order_item2 = build(:order_item, total: nil)
    expect(order_item2).to_not be_valid
  end

  it "is not valid without a quantity" do
    order_item2 = build(:order_item, quantity: nil)
    expect(order_item2).to_not be_valid
  end

  it "is not valid with lesser than 0.0 a total" do
    order_item2 = build(:order_item, total: -1.0)
    expect(order_item2).to_not be_valid
  end
  
  it "is not valid with lesser than 0 a quantity" do
    order_item2 = build(:order_item, quantity: -1)
    expect(order_item2).to_not be_valid
  end
end
