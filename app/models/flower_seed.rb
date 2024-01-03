class FlowerSeed < ApplicationRecord
  has_many :flower_fields

  validates :name, presence: true, uniqueness: true
end
