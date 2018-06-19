class Record < ApplicationRecord
  belongs_to :genre
  has_many :songs, dependent: :destroy
  validates :name, :release_date, :genre_id, presence: true
  validates :genre_id, numericality: true
  validates :record_id, numericality: true, if: Proc.new {|instance| instance.record_id.present?}
  validates :record_id, uniqueness: true

  before_save do
    if self.record_id == nil
      self.record_id = Record.maximum(:record_id).to_i + 1
    end
  end
end
