class RadioPerformance < ApplicationRecord
  belongs_to :the_radio, class_name: "Radio", foreign_key: :radio
  belongs_to :performance
  validates :performance_id, uniqueness: {scope: [:radio, :time]}
  validates :performance_id, :radio, :time, presence: true
  validates :performance_id, numericality: true
  before_save :air_time

  private

  def air_time
    song_start = self.time
    song_end = song_start + self.performance&.song.interval_in_seconds

    RadioPerformance.where(radio: self.radio).find_each do |radio_performance|
      if radio_performance.attributes == self.attributes
        # puts radio_performance.attributes
        # puts self.attributes
        next
      end

      played_song_start = radio_performance.time
      played_song_end = played_song_start + radio_performance.performance.song.interval_in_seconds

      if played_song_start >= song_start && played_song_start <= song_end
        errors[:base] << "Another song is played: #{radio_performance.performance.song.name}, #{radio_performance.time}, #{radio_performance.performance.song.interval}"
        throw :abort
      end

      if song_start >= played_song_start && song_start <= played_song_end
        errors[:base] << "Another song is played: #{radio_performance.performance.song.name}, #{radio_performance.time}, #{radio_performance.performance.song.interval}"
        throw :abort
      end
    end
  end
end
