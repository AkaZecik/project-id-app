class Record < ApplicationRecord
  belongs_to :genre
  has_many :songs
  validates :name, :release_date, :genre_id, presence: true
  validates :record_id, :genre_id, numericality: true
end
