class MemberFunction < ApplicationRecord
  attr_accessor :function_still_active
  belongs_to :the_function, class_name: "Function", foreign_key: :function
  belongs_to :member
  validates :member_id, uniqueness: {scope: [:function, :since]}
  validates :member_id, :function, :since, presence: true
  validates :member_id, numericality: true
  validate :start_before_end

  before_save do
    if function_still_active
      self.until = nil
    end
  end

  private
    def start_before_end
      if self.until.present? && since > self.until
        errors[:until] << "can't be earlier than since"
      end
    end
end
