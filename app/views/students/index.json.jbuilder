json.array!(@students) do |student|
  json.extract! student, :id, :classroom_id, :first_name, :last_name, :doB
  json.url student_url(student, format: :json)
end
