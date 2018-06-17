class RadioPerformance < ApplicationRecord
  belongs_to :radio, foreign_key: :radio
  belongs_to :performance
  validates :performance_id, uniqueness: {scope: [:radio, :time]}
end
