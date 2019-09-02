FactoryBot.define do
  factory :cart_discount do
    order { nil }
    discount_price { 1.5 }
    discount_total { 1.5 }
  end
end
