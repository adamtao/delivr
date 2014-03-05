# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    cart
    quantity 1
    unit_price_cents 10000
    item
  end
end
