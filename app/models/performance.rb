class Performance < ApplicationRecord
  belongs_to :song
  has_many :event_performances
  has_many :radio_performances
  validates :song_id, presence: true
  validates :song_id, :performance_id, numericality: true
end
