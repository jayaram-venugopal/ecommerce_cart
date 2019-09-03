require 'rails_helper'

RSpec.describe CartDiscount, type: :model do
  before(:all) do
    @cart_discount1 = create(:cart_discount)
  end

  it "is valid with valid attributes" do
    expect(@cart_discount1).to be_valid
  end

  it "is not valid without a discount_price" do
    cart_discount2 = build(:cart_discount, discount_price: nil)
    expect(cart_discount2).to_not be_valid
  end

  it "is not valid without a grand_total" do
    cart_discount2 = build(:cart_discount, grand_total: nil)
    expect(cart_discount2).to_not be_valid
  end

  it "is not valid with lesser than 0.0 a discount_price" do
    cart_discount2 = build(:cart_discount, discount_price: -1.0)
    expect(cart_discount2).to_not be_valid
  end
  
  it "is not valid with lesser than 0.0  a grand_total" do
    cart_discount2 = build(:cart_discount, grand_total: -1.0)
    expect(cart_discount2).to_not be_valid
  end
end
