class Radio < ApplicationRecord
  has_many :radio_performances, dependent: :destroy, foreign_key: :radio
  has_many :performances, through: :radio_performances
  has_many :songs, through: :performances
  validates :name, uniqueness: true, presence: true
end
