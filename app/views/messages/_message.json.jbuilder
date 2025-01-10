json.extract! message, :id, :user_id, :channel_id, :message_type, :content, :sent_at, :raw_data_store, :created_at, :updated_at
json.url message_url(message, format: :json)
