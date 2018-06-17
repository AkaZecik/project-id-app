class Member < ApplicationRecord
  belongs_to :person
  belongs_to :artist
  has_many :member_functions
end
