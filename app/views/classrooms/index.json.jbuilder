json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :school_id, :standard, :division
  json.url classroom_url(classroom, format: :json)
end
