class Soundtrack < ApplicationRecord
  belongs_to :song
  belongs_to :production
  validates :song_id, uniqueness: {scope: :production_id}
end
