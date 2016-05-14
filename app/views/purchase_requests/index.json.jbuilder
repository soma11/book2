json.array!(@purchase_requests) do |purchase_request|
  json.extract! purchase_request, :id
  json.url purchase_request_url(purchase_request, format: :json)
end
