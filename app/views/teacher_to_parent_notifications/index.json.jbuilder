json.array!(@teacher_to_parent_notifications) do |teacher_to_parent_notification|
  json.extract! teacher_to_parent_notification, :id, :teacher_id, :parent_id, :importance, :subject, :content, :show_until
  json.url teacher_to_parent_notification_url(teacher_to_parent_notification, format: :json)
end
