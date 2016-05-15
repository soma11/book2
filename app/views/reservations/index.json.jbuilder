json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :reserved_user_id
  json.url reservation_url(reservation, format: :json)
end
