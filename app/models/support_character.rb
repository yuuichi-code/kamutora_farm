class SupportCharacter < ApplicationRecord
  belongs_to :post
  belongs_to :character

  validates :post_id, uniqueness: { scope: :character_id }
  validates :post_id, presence: true
  validates :character_id, presence: true
end
