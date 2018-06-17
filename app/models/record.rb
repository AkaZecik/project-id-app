class Record < ApplicationRecord
  belongs_to :genre
  has_many :songs
  validates :name, :release_date, :genre_id, presence: true
  validates :genre_id, numericality: true
  validates :record_id, numericality: true, if: Proc.new {|instance| instance.record_id.present?}
end
