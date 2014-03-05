# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    description "Item description"
    price_cents 10000
  end
end
