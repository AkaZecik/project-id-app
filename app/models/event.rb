class Event < ApplicationRecord
  has_many :appearances
  validates :name, presence: true, unless: Proc.new {|instance| instance.name.present?}
  validates :place, :begin_date, :end_date, presence: true
  validates :event_id, numericality: true, if: Proc.new {|instance| instance.event_id.present?}
  validate :start_before_end


  before_create do
    if self.event_id == nil
      self.event_id = Event.maximum(:event_id).to_i + 1
    end
  end

  private

  def start_before_end
    if begin_date > end_date
      errors << "Event cannot start after its end"
    end
  end
end
