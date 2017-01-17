json.extract! event, :id, :name, :day, :start, :end, :bar_id, :created_at, :updated_at
json.url event_url(event, format: :json)