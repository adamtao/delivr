json.array!(@downloads) do |download|
  json.extract! download, :id, :name, :item_id, :file_file_name, :file_content_type, :file_file_size, :file_updated_at
  json.url download_url(download, format: :json)
end
