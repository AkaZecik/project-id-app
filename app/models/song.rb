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
  validates :artist_id, :record_id, numericality: true
  validates :song_id, numericality: true, if: Proc.new {|instance| instance.song_id.present?}
  validates :cover_of, numericality: true, if: Proc.new {|instance| instance.cover_of.present?}
  validate :interval_cannot_be_negative

  before_save do
    if self.song_id == nil
      self.song_id = Song.maximum(:song_id).to_i + 1
    end
  end

  private

  def interval_cannot_be_negative
    unless interval =~ /\d*/
      errors << "Interval cannot be negative"
    end
  end
end
