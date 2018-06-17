class Radio < ApplicationRecord
  has_many :radio_performances
  has_many :performances, through: :radio_performances
  validates :name, uniqueness: true
end
