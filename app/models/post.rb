class Post < ApplicationRecord
  belongs_to :user
  has_many :support_characters, dependent: :destroy
  has_many :post_characters, through: :support_characters, source: :character

  validates :title, presence: true
end
