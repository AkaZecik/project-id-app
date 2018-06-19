class Featuring < ApplicationRecord
  belongs_to :artist
  belongs_to :song
  validates :artist_id, uniqueness: {scope: :song_id}
  validates :artist_id, :song_id, presence: true, numericality: true
  validate :self_featuring

  private

  def self_featuring
    if self.artist_id == Song.find_by(artist_id: self.artist_id)&.artist_id
      errors[:base] << "Artists cannot feature themselves"
      throw :abort
    end
  end
end
