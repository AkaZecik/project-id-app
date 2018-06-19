class GenreDependency < ApplicationRecord
  belongs_to :genre, class_name: "Genre", foreign_key: :genre_id
  belongs_to :super_genre, class_name: "Genre", foreign_key: :super_genre_id

  validates :genre_id, uniqueness: {scope: :super_genre_id}
  validates :genre_id, :super_genre_id, presence: true
  validates :genre_id, :super_genre_id, numericality: true
  validate :no_cycle_dependencies

  private

  def no_cycle_dependencies
    super_genre_id = self.super_genre_id
    arr = [genre_id]

    while super_genre_id != nil
      arr << super_genre_id
      if super_genre_id == self.genre_id
        errors[:base] << "Genre dependency should not form cycles: #{arr.join(" < ")}"
        throw :abort
      end

      puts "self.genre_id: #{self.genre_id}, self.super_genre_id: #{self.super_genre_id}"
      puts "super_genre_id: #{super_genre_id}"

      super_genre_id = GenreDependency.find_by(genre_id: super_genre_id)&.super_genre_id
    end
  end
end
