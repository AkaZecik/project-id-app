class ProductionType < ApplicationRecord
  belongs_to :the_production_type, class_name: "ProductionType", foreign_key: :super_type, optional: true
  has_many :production_super_types, class_name: "ProductionType", foreign_key: :super_type
  has_many :productions, dependent: :destroy
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :production_type_id, numericality: true, if: Proc.new {|instance| instance.production_type_id.present?}
  validates :super_type, numericality: true, if: Proc.new {|instance| instance.super_type.present?}
  validates :production_type_id, uniqueness: true
  validate :no_cycle_dependencies

  before_save do
    if self.production_type_id == nil
      self.production_type_id = ProductionType.maximum(:production_type_id).to_i + 1
    end
  end

  before_destroy do
    ProductionType.where(super_type: production_type_id).update_all(super_type: nil)
  end

  private

  def no_cycle_dependencies
    super_type = self.super_type
    arr = [self.production_type_id]

    while super_type != nil
      arr << super_type

      if super_type == self.production_type_id
        errors[:base] << "Production type dependency should not form cycles: #{arr.join(" < ")}"
        throw :abort
      end

      super_type = ProductionType.find_by(production_type_id: super_type)&.super_type
    end
  end
end
