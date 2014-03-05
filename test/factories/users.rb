# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@email.com" }
    provider "MyProvider"
    sequence(:uid) { |n| n }
  end
end
