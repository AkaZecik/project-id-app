class Person < ApplicationRecord
  has_many :members
  validates :name, :surname, :date_of_birth, presence: true
  validates :stage_name, presence: true, unless: :stage_name.nil?
  validates :person_id, numericality: true
  validate :born_before_death

  private
    def born_before_death
      if date_of_birth > date_of_death
        errors << "Cannot die before being born"
      end
    end
end
