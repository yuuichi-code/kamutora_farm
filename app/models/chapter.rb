class Chapter < ApplicationRecord
  has_many :chapter_turns, dependent: :destroy
  has_many :turns, through: :chapter_turns, dependent: :destroy

  validates :chapter_number, presence: true, uniqueness: true
end
