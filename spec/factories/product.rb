FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    price { 1 }
  end
end
