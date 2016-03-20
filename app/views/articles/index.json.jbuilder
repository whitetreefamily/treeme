json.array!(@articles) do |article|
  json.extract! article, :id, :title, :body, :user_id, :category_id, :page_id, :image
  json.url article_url(article, format: :json)
end
