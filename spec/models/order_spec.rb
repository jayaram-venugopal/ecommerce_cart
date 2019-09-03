require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:all) do
    @order1 = create(:order)
  end

  it "is valid with valid attributes" do
    expect(@order1).to be_valid
  end

  it "is not valid without a subtotal" do
    order2 = build(:order, subtotal: nil)
    expect(order2).to_not be_valid
  end

  it "is not valid without a grand_total" do
    order2 = build(:order, grand_total: nil)
    expect(order2).to_not be_valid
  end

  it "is not valid with lesser than 0.0 a subtotal" do
    order2 = build(:order, subtotal: -1.0)
    expect(order2).to_not be_valid
  end
  
  it "is not valid with lesser than 0.0  a grand_total" do
    order2 = build(:order, grand_total: -1.0)
    expect(order2).to_not be_valid
  end
end
