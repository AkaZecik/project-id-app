class EventPerformance < ApplicationRecord
  belongs_to :appearance
  belongs_to :performance
  validates :performance_id, uniqueness: {scope: :appearance_id}
end
