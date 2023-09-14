class SupportCharacter < ApplicationRecord
  belongs_to :post
  belongs_to :character

  validates :post_id, uniqueness: { scope: :character_id }
end
