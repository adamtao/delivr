# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name "MyString"
    slug "MyString"
    description "MyText"
    price_cents 1
  end
end
