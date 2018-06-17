class MemberFunction < ApplicationRecord
  validates :member_id, uniqueness: {scope: [:function, :since]}
end
