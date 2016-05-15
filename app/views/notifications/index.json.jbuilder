json.array!(@notifications) do |notification|
  json.extract! notification, :id, :sender_id, :receiver_id, :subject, :description, :created_at
end
