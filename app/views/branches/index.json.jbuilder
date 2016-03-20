json.array!(@branches) do |branch|
  json.extract! branch, :id, :user_id, :branch_id
  json.url branch_url(branch, format: :json)
end
