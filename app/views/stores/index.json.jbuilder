json.array!(@stores) do |store|
  json.extract! store, :id, :address, :string, :city, :zip_code, :country, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :monday_start, :monday_end, :tuesday_start, :tuesday_end, :wednesday_start, :wednesday_end, :thursday_start, :thursday_end, :friday_start, :friday_end, :saturday_start, :saturday_end, :sunday_start, :sunday_end
  json.url store_url(store, format: :json)
end