json.array!(@schools) do |school|
  json.extract! school, :id, :name, :city, :address, :contact_number, :email_address, :is_pending
  json.url school_url(school, format: :json)
end
