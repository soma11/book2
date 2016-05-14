json.array!(@products) do |product|
  json.extract! product, :id, :m_book_id, :status, :requested_date, :request_user_id
  json.url product_url(product, format: :json)
end
