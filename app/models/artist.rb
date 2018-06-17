class Artist < ApplicationRecord
  has_many :members
  has_many :appearances
  has_many :featuring
  has_many :songs
  validates :artist_id, presence: true, numericality: true, if: Proc.new {|instance| instance.artist_id.present?}

  before_create do
    if self.artist_id == nil
      self.artist_id = Artist.maximum(:artist_id).to_i + 1
    end
  end
end
