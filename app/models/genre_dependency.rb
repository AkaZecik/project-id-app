class GenreDependency < ApplicationRecord
  validates :genre_id, uniqueness: {scope: :super_genre_id}
end
