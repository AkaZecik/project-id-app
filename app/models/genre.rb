class Genre < ApplicationRecord
  has_many :genre_dependencies, class_name: "GenreDependency", foreign_key: :genre_id
  has_many :super_genre_dependencies, class_name: "GenreDependency", foreign_key: :super_genre_id
  validates :name, uniqueness: true, presence: true
  validates :genre_id, numericality: true, if: Proc.new {|instance| instance.genre_id.present?}


  before_create do
    if self.genre_id == nil
      self.genre_id = Genre.maximum(:genre_id).to_i + 1
    end
  end
end
