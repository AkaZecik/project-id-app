class Person < ApplicationRecord
  has_many :members
  validates :name, :surname, presence: true
end
