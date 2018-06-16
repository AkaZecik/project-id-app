json.extract! song, :id, :song_id, :name, :artist_id, :record_id, :interval, :cover_of, :created_at, :updated_at
json.url song_url(song, format: :json)
