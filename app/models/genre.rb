class Genre < ApplicationRecord
  has_many :genre_dependencies, class_name: "GenreDependency", foreign_key: :genre_id
  has_many :super_genre_dependencies, class_name: "GenreDependency", foreign_key: :super_genre_id
  validates :name, uniqueness: true, presence: true
  validates :genre_id, numericality: true
end
