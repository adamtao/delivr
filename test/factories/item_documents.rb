# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_document do
    item_id 1
    document_file_name "MyString"
    document_content_type "MyString"
    document_file_size 1
    document_updated_at "2014-03-04 14:47:16"
  end
end
