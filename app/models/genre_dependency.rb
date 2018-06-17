class GenreDependency < ApplicationRecord
  belongs_to :genre, class_name: "Genre", foreign_key: :genre_id
  belongs_to :super_genre, class_name: "Genre", foreign_key: :super_genre_id
  validates :genre_id, uniqueness: {scope: :super_genre_id}
  validates :genre_id, :super_genre_id, presence: true
  validates :genre_id, :super_genre_id, numericality: true
end
