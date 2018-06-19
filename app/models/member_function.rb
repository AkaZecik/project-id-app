class MemberFunction < ApplicationRecord
  belongs_to :the_function, class_name: "Function", foreign_key: :function
  belongs_to :member
  validates :member_id, uniqueness: {scope: [:function, :since]}
  validates :member_id, :function, :since, presence: true
  validates :member_id, numericality: true
  validate :start_before_end
  validate :correct_dates_order

  private

  def start_before_end
    if self.until.present? && since > self.until
      errors[:until] << "can't be earlier than since"
    end
  end

  def correct_dates_order
    date_of_birth = self&.member&.person&.date_of_birth
    date_of_death = self&.member&.person&.date_of_death
    should_throw = false

    if date_of_birth.present? && self.since.present? && self.since < date_of_birth
      errors[:since] << "Member cannot start his function before his birth"
      should_throw = true
    end

    if date_of_death.present? && self.since.present? && self.since > date_of_death
      errors[:since] << "Member cannot start his function after his death"
      should_throw = true
    end

    if date_of_birth.present? && self.until.present? && self.until < date_of_birth
      errors[:base] << "Member cannot stop his function before his birth"
      should_throw = true
    end

    if date_of_death.present? && self.until.present? && self.until > date_of_death
      errors[:base] << "Member cannot stop his function after his death"
      should_throw = true
    end

    throw :abort if should_throw
  end
end
