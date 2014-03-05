# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_image do
    item
    # image
    role "banner"
    position 1
  end
end
