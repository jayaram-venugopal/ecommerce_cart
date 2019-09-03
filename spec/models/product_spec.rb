require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @product1 = create(:product)
  end

  it "is valid with valid attributes" do
    expect(@product1).to be_valid
  end

  it "has a unique name" do
    product2 = build(:product, name: @product1.name)
    expect(product2).to_not be_valid
  end

  it "is not valid without a name" do
    product2 = build(:product, name: nil)
    expect(product2).to_not be_valid
  end
  it "is not valid without a price" do
    product2 = build(:product, price: nil)
    expect(product2).to_not be_valid
  end
  it "is not valid without a quantity" do
    product2 = build(:product, quantity: nil)
    expect(product2).to_not be_valid
  end
end
