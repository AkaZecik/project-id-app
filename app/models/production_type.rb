class ProductionType < ApplicationRecord
  belongs_to :production_type, class_name: "ProductionType", foreign_key: :super_type
  has_many :production_super_types, class_name: "ProductionType", foreign_key: :super_type
  has_many :productions
end
