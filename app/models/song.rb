class Song < ApplicationRecord
  belongs_to :record
  belongs_to :artist
  belongs_to :song, foreign_key: :cover_of
  has_many :covers, class_name: "Song", foreign_key: :cover_of
  has_many :soundtracks
  has_many :performances
  has_many :featuring
end
