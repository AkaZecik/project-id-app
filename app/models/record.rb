class Record < ApplicationRecord
  belongs_to :genre
  has_many :songs
end
