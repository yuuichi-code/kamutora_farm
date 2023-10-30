class Turn < ApplicationRecord
  has_many :chapter_turns, dependent: :destroy
  has_many :chapters, through: :chapter_turns

  validates :turn_number, presence: true, uniqueness: true
end
