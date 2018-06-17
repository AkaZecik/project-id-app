class RadioPerformance < ApplicationRecord
  belongs_to :the_radio, class_name: "Radio", foreign_key: :radio
  belongs_to :performance
  validates :performance_id, uniqueness: {scope: [:radio, :time]}
end
