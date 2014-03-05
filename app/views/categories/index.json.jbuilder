json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :header_image_file_name, :header_image_content_type, :header_image_updated_at, :header_image_file_size, :slug
  json.url category_url(category, format: :json)
end
