class ChapterTurn < ApplicationRecord
  belongs_to :chapter
  belongs_to :turn
  has_many :flower_fields
  has_many :training_actions
  has_many :training_advices
  has_many :character_fields

  validates :chapter_id, uniqueness: { scope: :turn_id }

  private

  def self.chapter1_turn1
    chapter_turn = find_by(chapter_id: 1, turn_id: 1)
    chapter_turn&.id
  end

  def self.chapter1_turn2
    chapter_turn = find_by(chapter_id: 1, turn_id: 2)
    chapter_turn&.id
  end

  def self.chapter1_turn3
    chapter_turn = find_by(chapter_id: 1, turn_id: 3)
    chapter_turn&.id
  end

  def self.chapter1_turn4
    chapter_turn = find_by(chapter_id: 1, turn_id: 4)
    chapter_turn&.id
  end

  def self.chapter1_turn5
    chapter_turn = find_by(chapter_id: 1, turn_id: 5)
    chapter_turn&.id
  end

  def self.chapter1_turn6
    chapter_turn = find_by(chapter_id: 1, turn_id: 6)
    chapter_turn&.id
  end

  def self.chapter1_turn7
    chapter_turn = find_by(chapter_id: 1, turn_id: 7)
    chapter_turn&.id
  end

  def self.chapter1_turn8
    chapter_turn = find_by(chapter_id: 1, turn_id: 8)
    chapter_turn&.id
  end

  def self.chapter2_turn1
    chapter_turn = find_by(chapter_id: 2, turn_id: 1)
    chapter_turn&.id
  end

  def self.chapter2_turn2
    chapter_turn = find_by(chapter_id: 2, turn_id: 2)
    chapter_turn&.id
  end

  def self.chapter2_turn3
    chapter_turn = find_by(chapter_id: 2, turn_id: 3)
    chapter_turn&.id
  end

  def self.chapter2_turn4
    chapter_turn = find_by(chapter_id: 2, turn_id: 4)
    chapter_turn&.id
  end

  def self.chapter2_turn5
    chapter_turn = find_by(chapter_id: 2, turn_id: 5)
    chapter_turn&.id
  end

  def self.chapter2_turn6
    chapter_turn = find_by(chapter_id: 2, turn_id: 6)
    chapter_turn&.id
  end

  def self.chapter2_turn7
    chapter_turn = find_by(chapter_id: 2, turn_id: 7)
    chapter_turn&.id
  end

  def self.chapter2_turn8
    chapter_turn = find_by(chapter_id: 2, turn_id: 8)
    chapter_turn&.id
  end
end
