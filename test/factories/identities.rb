# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "name#{n}@email.com" }
    password_digest "MyString"
  end
end
