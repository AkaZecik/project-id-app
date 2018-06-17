class Featuring < ApplicationRecord
  belongs_to :artist
  belongs_to :song
  has_many :featured_songs, class_name: "Song", through: :featuring
  validates :artist_id, uniqueness: {scope: :song_id}
end
