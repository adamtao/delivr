# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name "MyString"
    description "MyText"
    header_image_file_name "MyString"
    header_image_content_type "MyString"
    header_image_updated_at "2014-03-04 13:03:26"
    header_image_file_size 1
    slug "MyString"
  end
end
