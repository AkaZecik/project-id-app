class Production < ApplicationRecord
  belongs_to :production_type
  has_many :soundtracks
  has_many :songs, through: :soundtracks
  validates :name, :author, :production_type_id, presence: true
  validates :production_id, :production_type_id, numericality: true
end
