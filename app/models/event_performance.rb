class EventPerformance < ApplicationRecord
  validates :performance_id, uniqueness: {scope: :appearance_id}
end
