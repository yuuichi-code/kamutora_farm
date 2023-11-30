class Character < ApplicationRecord
  has_many :support_characters, dependent: :destroy
  has_many :posts, through: :support_characters, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :unit_element, presence: true
  validates :initial_rarity, presence: true

  enum unit_element: { fire: 1, aqua: 2, wind: 3, earth: 4, master: 5, composite: 6 }

  #チャートの外周の名前を規定の順番に変更するため
  def self.chart_column_name_sort
    column_names.values_at(1,5,6,7,8,4,3,2)
  end
  #チャートのパラメーターを規定の順番に変更するため
  def chart_status_sort
    attributes.values_at("hp", "cri", "crd", "hit", "avd", "spd", "def", "atk")
  end
end
