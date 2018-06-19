class Artist < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :appearances, dependent: :destroy
  has_many :featuring, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :featured_songs, class_name: "Song", through: :featuring, source: :song, dependent: :destroy
  validates :artist_id, presence: true, numericality: true, if: Proc.new {|instance| instance.artist_id.present?}
  validates :artist_id, uniqueness: true

  before_save do
    if self.artist_id == nil
      self.artist_id = Artist.maximum(:artist_id).to_i + 1
    end
  end
end
