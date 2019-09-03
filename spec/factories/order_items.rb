FactoryBot.define do
  factory :order_item do
    association :product
    association :order
    quantity { 3 }
    total { 1.5 }
  end
end
