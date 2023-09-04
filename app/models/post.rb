class Post < ApplicationRecord
  belongs_to :user
  has_many :support_characters, dependent: :destroy
  has_many :characters, through: :support_characters

  validates :title, presence: true
end
