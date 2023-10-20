class PostFormStep2
  include ActiveModel::Model

  attr_accessor :first_day_action, :second_day_action, :third_day_action, :fourth_day_action, :fifth_day_action, :sixth_day_action, :seventh_day_action, :eighth_day_action
  attr_accessor :first_day_remark, :second_day_remark, :third_day_remark, :fourth_day_remark, :fifth_day_remark, :sixth_day_remark, :seventh_day_remark, :eighth_day_remark

  validates :first_day_action,    presence: true
  validates :second_day_action,   presence: true
  validates :third_day_action,    presence: true
  validates :fourth_day_action,   presence: true
  validates :fifth_day_action,    presence: true
  validates :sixth_day_action,    presence: true
  validates :seventh_day_action,  presence: true
  validates :eighth_day_action,   presence: true

end
