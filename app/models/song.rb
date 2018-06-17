class Song < ApplicationRecord
  belongs_to :record
  belongs_to :artist
  belongs_to :covered_song, class_name: "Song", foreign_key: :cover_of, optional: true
  has_many :covers, class_name: "Song", foreign_key: :cover_of
  has_many :soundtracks
  has_many :performances
  has_many :featuring
  has_many :featuring_artists, class_name: "Artist", through: :featuring
  has_many :uses_in_productions, through: :soundtracks
  validates :name, :artist_id, :record_id, :interval, presence: true
  validates :song_id, :artist_id, :record_id, :cover_of, numericality: true
  validate :interval_not_negative

  private
    def interval_not_negative
      if interval < 0
        errors << "Interval cannot be negative"
      end
    end
end
