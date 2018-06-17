class Person < ApplicationRecord
  attr_accessor :date_of_death_nil
  has_many :members
  validates :name, :surname, :date_of_birth, presence: true
  validates :stage_name, presence: true, if: Proc.new {|instance| instance.stage_name.present?}
  validates :person_id, numericality: true, if: Proc.new {|instance| instance.person_id.present?}
  validate :born_before_death
  validates :person_id, uniqueness: true

  before_save do
    if self.person_id == nil
      self.person_id = Person.maximum(:person_id).to_i + 1
    end

    if date_of_death_nil == "1"
      puts "\nSetting date of death to nil\n"
      self.date_of_death = nil
    end
  end

  private

  def born_before_death
    if date_of_death.present? && date_of_birth > date_of_death
      errors[:date_of_death] << "can't be before date of birth"
    end
  end
end
