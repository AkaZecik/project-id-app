class ProductionType < ApplicationRecord
  belongs_to :the_production_type, class_name: "ProductionType", foreign_key: :super_type, optional: true
  has_many :production_super_types, class_name: "ProductionType", foreign_key: :super_type
  has_many :productions
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :production_type_id, numericality: true, if: Proc.new {|instance| instance.production_type_id.present?}
  validates :super_type, numericality: true, if: Proc.new {|instance| instance.super_type.present?}

  before_create do
    if production_type_id == nil
      production_type_id = ProductionType.maximum(:production_type_id).to_i + 1
    end
  end
end
