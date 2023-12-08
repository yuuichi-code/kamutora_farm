class TrainingAction < ApplicationRecord
  belongs_to :action
  belongs_to :chapter_turn
  belongs_to :post
end
