class ProductionType < ApplicationRecord
  belongs_to :the_production_type, class_name: "ProductionType", foreign_key: :super_type, optional: true
  has_many :production_super_types, class_name: "ProductionType", foreign_key: :super_type
  has_many :productions
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :production_type_id, :super_type, numericality: true
end
