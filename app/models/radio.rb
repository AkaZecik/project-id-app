class Radio < ApplicationRecord
  has_many :radio_performances, dependent: :destroy
  has_many :performances, through: :radio_performances, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
