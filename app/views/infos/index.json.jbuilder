json.array!(@infos) do |info|
  json.extract! info, :id, :page_id, :name
  json.url info_url(info, format: :json)
end
