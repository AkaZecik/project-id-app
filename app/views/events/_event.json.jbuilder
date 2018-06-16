json.extract! event, :id, :event_id, :name, :place, :begin_date, :end_date, :created_at, :updated_at
json.url event_url(event, format: :json)
