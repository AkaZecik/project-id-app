class Performance < ApplicationRecord
  belongs_to :song
  has_many :event_performances, dependent: :destroy
  has_many :radio_performances, dependent: :destroy
  validates :song_id, presence: true
  validates :song_id, numericality: true
  validates :performance_id, numericality: true, if: Proc.new {|instance| instance.performance_id.present?}
  validates :performance_id, uniqueness: true

  before_save do
    if self.performance_id == nil
      self.performance_id = Performance.maximum(:performance_id).to_i + 1
    end
  end
end
