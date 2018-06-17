class Performance < ApplicationRecord
  belongs_to :song
  has_many :event_performances
  has_many :radio_performances
  validates :song_id, presence: true
  validates :song_id, numericality: true
  validates :performance_id, numericality: true, if: Proc.new {|instance| instance.performance_id.present?}
end
