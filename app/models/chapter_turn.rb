class ChapterTurn < ApplicationRecord
  belongs_to :chapter
  belongs_to :turn

  validates :chapter_id, uniqueness: { scope: :turn_id }
end
