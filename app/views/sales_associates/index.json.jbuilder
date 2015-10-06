json.array!(@sales_associates) do |sales_associate|
  json.extract! sales_associate, :id, :first_name, :last_name, :email, :be_contacted, :be_rated
  json.url sales_associate_url(sales_associate, format: :json)
end
