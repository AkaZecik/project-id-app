class Member < ApplicationRecord
  belongs_to :person
  belongs_to :artist
  has_many :member_functions
  has_many :functions, through: :member_functions
end
