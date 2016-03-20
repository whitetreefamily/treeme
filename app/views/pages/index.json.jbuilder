json.array!(@pages) do |page|
  json.extract! page, :id, :name, :page_no, :user_id, :image
  json.url page_url(page, format: :json)
end
