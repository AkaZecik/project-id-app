class Person < ApplicationRecord
  has_many :members
  validates :name, :surname, :date_of_birth, presence: true
  validates :stage_name, presence: true, if: Proc.new {|instance| instance.stage_name.present?}
  validates :person_id, numericality: true, if: Proc.new {|instance| instance.person_id.present?}
  validate :born_before_death

  before_create do
    if self.person_id == nil
      self.person_id = Person.maximum(:person_id).to_i + 1
    end
  end

  private

  def born_before_death
    if date_of_death.present? && date_of_birth > date_of_death
      errors << "Cannot die before being born"
    end
  end
end
