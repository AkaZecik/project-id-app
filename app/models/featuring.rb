class Featuring < ApplicationRecord
  belongs_to :artist
  belongs_to :song
  validates :artist_id, uniqueness: {scope: :song_id}
end
