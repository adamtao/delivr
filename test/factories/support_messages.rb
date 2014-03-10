# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :support_message do
    name "MyString"
    email "MyString"
    subject "MyString"
    message "MyText"
  end
end
