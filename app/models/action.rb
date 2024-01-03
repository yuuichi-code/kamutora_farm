class Action < ApplicationRecord
  validates :content, presence: true, uniqueness: true
end
