class Appearance < ApplicationRecord
  belongs_to :event
  belongs_to :artist
  has_many :event_performances
  has_many :performances, through: :event_performances
end
