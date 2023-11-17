class PostFormStep5
  include ActiveModel::Model

  attr_accessor :first_day_action, :second_day_action, :third_day_action, :fourth_day_action, :fifth_day_action, :sixth_day_action, :seventh_day_action, :eighth_day_action,
                :first_day_remark, :second_day_remark, :third_day_remark, :fourth_day_remark, :fifth_day_remark, :sixth_day_remark, :seventh_day_remark, :eighth_day_remark,
                :day1_farm1_seed, :day2_farm1_seed, :day3_farm1_seed, :day4_farm1_seed, :day5_farm1_seed, :day6_farm1_seed, :day7_farm1_seed, :day8_farm1_seed,
                :day1_farm1_character, :day2_farm1_character, :day3_farm1_character, :day4_farm1_character, :day5_farm1_character, :day6_farm1_character, :day7_farm1_character, :day8_farm1_character,
                :day1_farm2_seed, :day2_farm2_seed, :day3_farm2_seed, :day4_farm2_seed, :day5_farm2_seed, :day6_farm2_seed, :day7_farm2_seed, :day8_farm2_seed,
                :day1_farm2_character, :day2_farm2_character, :day3_farm2_character, :day4_farm2_character, :day5_farm2_character, :day6_farm2_character, :day7_farm2_character, :day8_farm2_character,
                :day1_farm3_seed, :day2_farm3_seed, :day3_farm3_seed, :day4_farm3_seed, :day5_farm3_seed, :day6_farm3_seed, :day7_farm3_seed, :day8_farm3_seed,
                :day1_farm3_character, :day2_farm3_character, :day3_farm3_character, :day4_farm3_character, :day5_farm3_character, :day6_farm3_character, :day7_farm3_character, :day8_farm3_character,
                :day1_farm4_seed, :day2_farm4_seed, :day3_farm4_seed, :day4_farm4_seed, :day5_farm4_seed, :day6_farm4_seed, :day7_farm4_seed, :day8_farm4_seed,
                :day1_farm4_character, :day2_farm4_character, :day3_farm4_character, :day4_farm4_character, :day5_farm4_character, :day6_farm4_character, :day7_farm4_character, :day8_farm4_character,
                :day1_farm5_seed, :day2_farm5_seed, :day3_farm5_seed, :day4_farm5_seed, :day5_farm5_seed, :day6_farm5_seed, :day7_farm5_seed, :day8_farm5_seed,
                :day1_farm5_character, :day2_farm5_character, :day3_farm5_character, :day4_farm5_character, :day5_farm5_character, :day6_farm5_character, :day7_farm5_character, :day8_farm5_character,
                :day1_farm6_seed, :day2_farm6_seed, :day3_farm6_seed, :day4_farm6_seed, :day5_farm6_seed, :day6_farm6_seed, :day7_farm6_seed, :day8_farm6_seed,
                :day1_farm6_character, :day2_farm6_character, :day3_farm6_character, :day4_farm6_character, :day5_farm6_character, :day6_farm6_character, :day7_farm6_character, :day8_farm6_character,
                :day1_farm7_seed, :day2_farm7_seed, :day3_farm7_seed, :day4_farm7_seed, :day5_farm7_seed, :day6_farm7_seed, :day7_farm7_seed, :day8_farm7_seed,
                :day1_farm7_character, :day2_farm7_character, :day3_farm7_character, :day4_farm7_character, :day5_farm7_character, :day6_farm7_character, :day7_farm7_character, :day8_farm7_character,
                :day1_farm8_seed, :day2_farm8_seed, :day3_farm8_seed, :day4_farm8_seed, :day5_farm8_seed, :day6_farm8_seed, :day7_farm8_seed, :day8_farm8_seed,
                :day1_farm8_character, :day2_farm8_character, :day3_farm8_character, :day4_farm8_character, :day5_farm8_character, :day6_farm8_character, :day7_farm8_character, :day8_farm8_character,
                :day1_farm9_seed, :day2_farm9_seed, :day3_farm9_seed, :day4_farm9_seed, :day5_farm9_seed, :day6_farm9_seed, :day7_farm9_seed, :day8_farm9_seed,
                :day1_farm9_character, :day2_farm9_character, :day3_farm9_character, :day4_farm9_character, :day5_farm9_character, :day6_farm9_character, :day7_farm9_character, :day8_farm9_character

  validates :first_day_action,    presence: true
  validates :second_day_action,   presence: true
  validates :third_day_action,    presence: true
  validates :fourth_day_action,   presence: true
  validates :fifth_day_action,    presence: true
  validates :sixth_day_action,    presence: true
  validates :seventh_day_action,  presence: true
  validates :eighth_day_action,   presence: true
end