# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :download do
    name "MyString"
    item_id 1
    file_file_name "MyString"
    file_content_type "MyString"
    file_file_size 1
    file_updated_at "2014-03-04 13:12:09"
  end
end
