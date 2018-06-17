class Featuring < ApplicationRecord
  validates :artist_id, uniqueness: {scope: :song_id}
end
