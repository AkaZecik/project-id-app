class Performance < ApplicationRecord
  belongs_to :song
  has_many :event_performances
  has_many :radio_performances
end
