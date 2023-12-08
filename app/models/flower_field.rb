class FlowerField < ApplicationRecord
  belongs_to :farm_place
  belongs_to :flower_seed
  belongs_to :chapter_turn
  belongs_to :post
end
