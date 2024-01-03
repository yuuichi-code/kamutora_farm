class FarmPlace < ApplicationRecord
  has_many :flower_fields
  has_many :character_fields

  validates :farm_number, presence: true, uniqueness: true

  private

  def self.place1
    farm_place = find(1)
    farm_place&.id
  end

  def self.place2
    farm_place = find(2)
    farm_place&.id
  end

  def self.place3
    farm_place = find(3)
    farm_place&.id
  end

  def self.place4
    farm_place = find(4)
    farm_place&.id
  end

  def self.place5
    farm_place = find(5)
    farm_place&.id
  end

  def self.place6
    farm_place = find(6)
    farm_place&.id
  end

  def self.place7
    farm_place = find(7)
    farm_place&.id
  end

  def self.place8
    farm_place = find(8)
    farm_place&.id
  end

  def self.place9
    farm_place = find(9)
    farm_place&.id
  end
end
