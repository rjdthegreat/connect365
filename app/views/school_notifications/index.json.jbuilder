json.array!(@school_notifications) do |school_notification|
  json.extract! school_notification, :id, :school_id, :importance, :subject, :content, :show_until
  json.url school_notification_url(school_notification, format: :json)
end
