class EventPerformance < ApplicationRecord
  belongs_to :appearance
  belongs_to :performance
  validates :performance_id, presence: true, uniqueness: {scope: :appearance_id}
  validates :performance_id, :appearance_id, numericality: true
end
