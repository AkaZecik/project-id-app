class Function < ApplicationRecord
  validates :name, uniqueness: true
end
