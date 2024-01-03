class FarmPlace < ApplicationRecord
  validates :farm_number, presence: true, uniqueness: true
end
