FactoryBot.define do
  factory :order_item do
    order { build(:order) }
    quantity { 1 }
    product { build(:product) }
  end
end
