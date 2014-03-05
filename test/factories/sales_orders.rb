# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sales_order do
    cart_id 1
    user_id 1
    stripe_charge_id "MyString"
    tax_cents 1
    ip_address "MyString"
  end
end
