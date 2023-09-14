class Post < ApplicationRecord
  belongs_to :user
  has_many :support_characters, dependent: :destroy
  has_many :post_characters, through: :support_characters, source: :character

  validates :title, presence: true

  def validate_support_character_uniqueness(character_ids)
    character_ids.uniq.length != character_ids.length if errors.add(:support_character, I18n.t('defaults.uniq'))
  end
end
