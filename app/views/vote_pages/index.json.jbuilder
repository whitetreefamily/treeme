json.array!(@vote_pages) do |vote_page|
  json.extract! vote_page, :id, :name, :user_id
  json.url vote_page_url(vote_page, format: :json)
end
