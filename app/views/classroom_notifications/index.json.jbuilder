json.array!(@classroom_notifications) do |classroom_notification|
  json.extract! classroom_notification, :id, :classroom_id, :importance, :subject, :content, :show_until
  json.url classroom_notification_url(classroom_notification, format: :json)
end
