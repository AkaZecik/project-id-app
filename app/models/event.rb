class Event < ApplicationRecord
  has_many :appearances
  validates :name, presence: true, unless: Proc.new {|instance| instance.name.present?}
  validates :place, :begin_date, :end_date, presence: true
  validates :event_id, numericality: true
  validate :start_before_end

  private

  def start_before_end
    if begin_date > end_date
      errors << "Event cannot start after its end"
    end
  end
end
