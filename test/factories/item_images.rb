# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_image do
    item_id 1
    image_file_name "MyString"
    image_file_size 1
    image_content_type "MyString"
    image_updated_at "2014-03-04 13:16:21"
    role "MyString"
    position 1
  end
end
