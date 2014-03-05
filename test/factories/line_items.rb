# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    cart_id 1
    quantity 1
    unit_price_cents 1
    item_id 1
  end
end
