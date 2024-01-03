class Action < ApplicationRecord
  has_many :training_actions

  validates :content, presence: true, uniqueness: true
end
