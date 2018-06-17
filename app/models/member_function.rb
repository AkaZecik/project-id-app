class MemberFunction < ApplicationRecord
  belongs_to :function, foreign_key: :function
  belongs_to :member
  validates :member_id, uniqueness: {scope: [:function, :since]}
end
