class Person < ApplicationRecord
  has_many :members
  has_many :member_functions, through: :members
  has_many :functions, through: :member_functions, source: :the_function
  validates :name, :surname, :date_of_birth, presence: true
  validates :stage_name, presence: true, if: Proc.new {|instance| instance.stage_name.present?}
  validates :person_id, numericality: true, if: Proc.new {|instance| instance.person_id.present?}
  validate :born_before_death
  validates :person_id, uniqueness: true

  before_save do
    if self.person_id == nil
      self.person_id = Person.maximum(:person_id).to_i + 1
    end
  end

  # def functions
  #   sql_code = <<~HEREDOC
  #     SELECT DISTINCT f.*
  #     FROM members m
  #       JOIN member_functions mf ON m.person_id = #{person_id}
  #         AND m.member_id = mf.member_id
  #       JOIN functions f ON mf.function = f.name;
  #   HEREDOC
  #
  #   # puts sql_code
  #   Function.find_by_sql(sql_code)
  #   Function.all
  # end

  private

  def born_before_death
    if date_of_death.present? && date_of_birth > date_of_death
      errors[:date_of_death] << "can't be before date of birth"
    end
  end
end
