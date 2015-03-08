json.array!(@parents) do |parent|
  json.extract! parent, :id, :student_id, :first_name, :last_name, :contact_number, :email_address, :is_pending
  json.url parent_url(parent, format: :json)
end
