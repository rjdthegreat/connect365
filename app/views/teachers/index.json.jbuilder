json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :classroom_id, :first_name, :last_name, :contact_number, :email_address, :is_pending
  json.url teacher_url(teacher, format: :json)
end
