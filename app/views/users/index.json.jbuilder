json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :password, :password_confirmation
  json.url user_url(user, format: :json)
end
