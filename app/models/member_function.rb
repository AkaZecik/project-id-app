class MemberFunction < ApplicationRecord
  belongs_to :the_function, class_name: "Function", foreign_key: :function
  belongs_to :member
  validates :member_id, uniqueness: {scope: [:function, :since]}
end
