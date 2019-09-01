FactoryBot.define do
  factory :order do
    subtotal { 1.5 }
    grand_total { 1.5 }
    discount { 1.5 }
  end
end
