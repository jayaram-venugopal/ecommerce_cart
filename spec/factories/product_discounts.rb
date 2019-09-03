FactoryBot.define do
  factory :product_discount do
    association :product
    discount_price { 1.5 }
    no_of_products { 1 }
  end
end
