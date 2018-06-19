class Song < ApplicationRecord
  belongs_to :record
  belongs_to :artist
  belongs_to :covered_song, class_name: "Song", foreign_key: :cover_of, optional: true
  has_many :covers, class_name: "Song", foreign_key: :cover_of
  has_many :soundtracks, dependent: :destroy
  has_many :performances, dependent: :destroy
  has_many :featuring, dependent: :destroy
  has_many :featuring_artists, class_name: "Artist", through: :featuring
  has_many :uses_in_productions, through: :soundtracks
  validates :name, :artist_id, :record_id, :interval, presence: true
  validates :artist_id, :record_id, numericality: true
  validates :song_id, numericality: true, if: Proc.new {|instance| instance.song_id.present?}
  validates :cover_of, numericality: true, if: Proc.new {|instance| instance.cover_of.present?}
  validate :interval_cannot_be_negative
  validates :song_id, uniqueness: true

  before_destroy do
    Song.where(cover_of: song_id).update_all(cover_of: nil)
  end

  before_save do
    if self.song_id == nil
      self.song_id = Song.maximum(:song_id).to_i + 1
    end
  end

  private

  def interval_cannot_be_negative
    unless interval =~ /\d*/
      errors[:interval] << "can't be negative"
    end
  end
end
