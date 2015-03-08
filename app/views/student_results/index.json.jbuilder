json.array!(@student_results) do |student_result|
  json.extract! student_result, :id, :exam_id, :student_id, :grade, :comments
  json.url student_result_url(student_result, format: :json)
end
