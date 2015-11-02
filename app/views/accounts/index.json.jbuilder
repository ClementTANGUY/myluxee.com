json.array!(@accounts) do |account|
  json.extract! account, :id, :first_name, :last_name, :email, :password, :password_confirmation
  json.url account_url(account, format: :json)
end
