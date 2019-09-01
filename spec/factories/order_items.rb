FactoryBot.define do
  factory :order_item do
    product { nil }
    order { nil }
    quantity { 1 }
    total { 1.5 }
    discount { 1.5 }
  end
end
