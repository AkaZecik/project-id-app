json.extract! record, :id, :record_id, :name, :release_date, :genre_id, :created_at, :updated_at
json.url record_url(record, format: :json)
