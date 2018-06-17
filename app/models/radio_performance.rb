class RadioPerformance < ApplicationRecord
  validates :performance_id, uniqueness: {scope: [:radio, :time]}
end
