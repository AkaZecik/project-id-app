class Appearance < ApplicationRecord
  belongs_to :event
  belongs_to :artist
  has_many :event_performances
  has_many :performances, through: :event_performances
  validates :artist_id, :event_id, presence: true, numericality: true
  validates :artist_id, uniqueness: {scope: :event_id}
  validates :appearance_id, numericality: true, if: Proc.new {|instance| instance.appearance_id.present?}


  before_create do
    if appearance_id == nil
      appearance_id = Appearance.maximum(:appearance_id).to_i + 1
    end
  end
end
