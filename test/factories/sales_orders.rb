# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sales_order do
    cart
    user
    # stripe_charge_id "MyString"
  end
end
