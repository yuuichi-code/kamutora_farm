class CharacterField < ApplicationRecord
  belongs_to :farm_place
  belongs_to :character
  belongs_to :chapter_turn
  belongs_to :post
end
