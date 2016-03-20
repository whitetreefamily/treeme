json.array!(@contestants) do |contestant|
  json.extract! contestant, :id, :user_id, :image, :name, :title
  json.url contestant_url(contestant, format: :json)
end
