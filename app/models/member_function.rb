class MemberFunction < ApplicationRecord
  belongs_to :the_function, class_name: "Function", foreign_key: :function
  belongs_to :member
  validates :member_id, uniqueness: {scope: [:function, :since]}
  validates :member_id, :function, :since, presence: true
  validates :member_id, numericality: true
  validate :start_before_end

  private
    def start_before_end
      if self.until.present? && since > self.until
        errors << "'Since' cannot be after 'until'"
      end
    end
end
