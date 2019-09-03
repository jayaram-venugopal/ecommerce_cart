require 'rails_helper'

RSpec.describe ProductDiscount, type: :model do
  before(:all) do
    @product_discount1 = create(:product_discount)
  end

  it "is valid with valid attributes" do
    expect(@product_discount1).to be_valid
  end

  it "is not valid without a product_id" do
    product_discount2 = build(:product_discount, product_id: nil)
    expect(product_discount2).to_not be_valid
  end

  it "is not valid without a discount_price" do
    product_discount2 = build(:product_discount, discount_price: nil)
    expect(product_discount2).to_not be_valid
  end
  
  it "is not valid without a no_of_products" do
    product_discount2 = build(:product_discount, no_of_products: nil)
    expect(product_discount2).to_not be_valid
  end

  it "is not valid with lesser than 0.0 a discount_price" do
    product_discount2 = build(:product_discount, discount_price: -1.0)
    expect(product_discount2).to_not be_valid
  end
  
  it "is not valid with lesser than 0 a no_of_products" do
    product_discount2 = build(:product_discount, no_of_products: -1)
    expect(product_discount2).to_not be_valid
  end
end
