# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category_item do
    item
    category
  end
end
