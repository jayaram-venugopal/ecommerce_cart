FactoryBot.define do
  price_array = [30, 20, 50, 15]

  factory :product do
    name { Faker::Commerce.product_name }
    price { price_array.sample }
    quantity { Faker::Number.between(from: 5, to: 10) }
  end
end
