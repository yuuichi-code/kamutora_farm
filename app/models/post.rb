class Post < ApplicationRecord
  belongs_to :user
  has_many :support_characters, dependent: :destroy
  has_many :post_characters, through: :support_characters, source: :character
  has_many :flower_fields
  has_many :character_fields
  has_one :training_character
  has_many :training_actions
  has_many :training_advices

  validates :title, presence: true
end
