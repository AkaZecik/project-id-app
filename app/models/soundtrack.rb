class Soundtrack < ApplicationRecord
  belongs_to :song
  belongs_to :production
  validates :song_id, uniqueness: {scope: :production_id}
  validates :song_id, :production_id, presence: true
  validates :song_id, :production_id, numericality: true
end
