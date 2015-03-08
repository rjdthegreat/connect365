json.array!(@parent_to_teacher_notifications) do |parent_to_teacher_notification|
  json.extract! parent_to_teacher_notification, :id, :parent_id, :teacher_id, :importance, :subject, :content, :show_until
  json.url parent_to_teacher_notification_url(parent_to_teacher_notification, format: :json)
end
