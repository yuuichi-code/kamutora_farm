class PostFormStep2
  include ActiveModel::Model

  attr_accessor :first_day_action, :second_day_action, :third_day_action, :fourth_day_action, :fifth_day_action, :sixth_day_action, :seventh_day_action, :eighth_day_action,
                :first_day_remark, :second_day_remark, :third_day_remark, :fourth_day_remark, :fifth_day_remark, :sixth_day_remark, :seventh_day_remark, :eighth_day_remark,
                :day2_farm1_seed, :day3_farm1_seed, :day4_farm1_seed, :day5_farm1_seed, :day6_farm1_seed, :day7_farm1_seed, :day8_farm1_seed,
                :day2_farm1_character, :day3_farm1_character, :day4_farm1_character, :day5_farm1_character, :day6_farm1_character, :day7_farm1_character, :day8_farm1_character,
                :day2_farm2_seed, :day3_farm2_seed, :day4_farm2_seed, :day5_farm2_seed, :day6_farm2_seed, :day7_farm2_seed, :day8_farm2_seed,
                :day2_farm2_character, :day3_farm2_character, :day4_farm2_character, :day5_farm2_character, :day6_farm2_character, :day7_farm2_character, :day8_farm2_character,
                :day6_farm3_seed, :day7_farm3_seed, :day8_farm3_seed,
                :day6_farm3_character, :day7_farm3_character, :day8_farm3_character,
                :day7_farm4_seed, :day8_farm4_seed,
                :day7_farm4_character, :day8_farm4_character,
                :day8_farm5_seed,
                :day8_farm5_character

  validates :first_day_action,    presence: true
  validates :second_day_action,   presence: true
  validates :third_day_action,    presence: true
  validates :fourth_day_action,   presence: true
  validates :fifth_day_action,    presence: true
  validates :sixth_day_action,    presence: true
  validates :seventh_day_action,  presence: true
  validates :eighth_day_action,   presence: true
end
