class Soundtrack < ApplicationRecord
  validates :song_id, uniqueness: {scope: :production_id}
end
