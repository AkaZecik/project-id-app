class Artist < ApplicationRecord
  has_many :members
  has_many :appearances
  has_many :featuring
  has_many :songs
  validates :artist_id, presence: true
end
