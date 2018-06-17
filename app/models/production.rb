class Production < ApplicationRecord
  belongs_to :production_type
  has_many :soundtracks
  has_many :songs, through: :soundtracks
  validates :name, :author, :production_type_id, presence: true
  validates :production_type_id, numericality: true
  validates :production_id, numericality: true, if: Proc.new {|instance| instance.production_id.present?}

  before_create do
    if production_id == nil
      production_id = Production.maximum(:production_id).to_i + 1
    end
  end
end
