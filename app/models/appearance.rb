class Appearance < ApplicationRecord
  belongs_to :event
  belongs_to :artist
  has_many :event_performances
  has_many :performances, through: :event_performances
  validates :artist_id, :event_id, presence: true, numericality: true
  validates :artist_id, uniqueness: {scope: :event_id}
end
