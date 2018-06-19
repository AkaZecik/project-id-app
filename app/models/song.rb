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
  validate :cover_after_song
  validate :artist_exists

  before_destroy do
    Song.where(cover_of: song_id).update_all(cover_of: nil)
  end

  before_save do
    if self.song_id == nil
      self.song_id = Song.maximum(:song_id).to_i + 1
    end
  end

  def interval_in_seconds
    seconds = 0

    self.interval.split(":").reverse.each_with_index do |val, index|
      seconds += val.to_i * 60 ** index.to_i
    end

    seconds
  end

  private

  def interval_cannot_be_negative
    unless interval =~ /\d*/
      errors[:interval] << "can't be negative"
    end
  end

  def cover_after_song
    covered_song_release_date = self.covered_song&.record.release_date
    own_release_date = self.record&.release_date

    if covered_song_release_date.present? && own_release_date.present? && covered_song_release_date > own_release_date
      errors[:base] << "Cover cannot be released before the covered song"
      throw :abort
    end
  end

  def artist_exists
    if self&.artist.start_date_before(self.record.release_date)
      errors[:base] << "Artist cannot create song before it exists"
      throw :abort
    end
  end
end
