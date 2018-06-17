class ProductionType < ApplicationRecord
  belongs_to :the_production_type, class_name: "ProductionType", foreign_key: :super_type, optional: true
  has_many :production_super_types, class_name: "ProductionType", foreign_key: :super_type
  has_many :productions
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :production_type_id, numericality: true, if: Proc.new {|instance| instance.production_type_id.present?}
  validates :super_type, numericality: true, if: Proc.new {|instance| instance.super_type.present?}
  validates :production_type_id, uniqueness: true

  before_save do
    if self.production_type_id == nil
      self.production_type_id = ProductionType.maximum(:production_type_id).to_i + 1
    end
  end
end
