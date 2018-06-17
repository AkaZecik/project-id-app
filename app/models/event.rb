class Event < ApplicationRecord
  has_many :appearances
  validates :name, presence: true, if: Proc.new {|instance| instance.name.present?}
  validates :place, :begin_date, :end_date, presence: true
  validates :event_id, numericality: true, if: Proc.new {|instance| instance.event_id.present?}
  validate :start_before_end
  validates :event_id, uniqueness: true

  before_save do
    if self.event_id == nil
      self.event_id = Event.maximum(:event_id).to_i + 1
    end
  end

  private

  def start_before_end
    if begin_date > end_date
      errors[:end_date] << "can't be set before begin date"
    end
  end
end
