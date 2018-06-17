class Production < ApplicationRecord
  belongs_to :production_type
  has_many :soundtracks
end
