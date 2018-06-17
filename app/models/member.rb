class Member < ApplicationRecord
  belongs_to :person
  belongs_to :artist
  has_many :member_functions
  has_many :functions, through: :member_functions
  validates :artist_id, uniqueness: {scope: [:member_id, :person_id]}
  validates :artist_id, :person_id, presence: true
  validates :member_id, :artist_id, :person_id, numericality: true
end
