FactoryBot.define do
  factory :cart_discount do
    discount_price { 1.5 }
    grand_total { 1.5 }
  end
end
