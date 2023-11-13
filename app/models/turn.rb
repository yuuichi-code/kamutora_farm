class Turn < ApplicationRecord
  has_many :chapter_turns, dependent: :destroy
  has_many :chapters, through: :chapter_turns

  validates :turn_number, presence: true, uniqueness: true

  def add_to_turn_number(chapter_number)
    case chapter_number
    when 2
      self.turn_number += 8
    when 3
      self.turn_number += 16
    when 4
      self.turn_number += 24
    end
  end
end
