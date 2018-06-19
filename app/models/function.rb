class Function < ApplicationRecord
  has_many :member_functions, foreign_key: :function, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
