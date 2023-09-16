class Character < ApplicationRecord
  has_many :support_characters, dependent: :destroy
  has_many :posts, through: :support_characters, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :unit_element, presence: true
  validates :initial_rarity, presence: true

  enum unit_element: { fire: 1, aqua: 2, wind: 3, earth: 4, master: 5, composite: 6 }
end
