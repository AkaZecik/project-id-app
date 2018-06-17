class Member < ApplicationRecord
  belongs_to :person
  belongs_to :artist
  has_many :member_functions
  has_many :functions, through: :member_functions
  validates :artist_id, uniqueness: {scope: [:member_id, :person_id]}
  validates :artist_id, :person_id, presence: true
  validates :artist_id, :person_id, numericality: true
  validates :member_id, numericality: true, if: Proc.new {|instance| instance.member_id.present?}


  before_create do
    if member_id == nil
      member_id = Member.maximum(:member_id).to_i + 1
    end
  end
end
