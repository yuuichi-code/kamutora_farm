class TrainingCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :post

  #レーダーチャートの各項目の上限値を合わせるため
  def chart_status
    hp_multiplier = 0.5
    atk_multiplier = 7.5
    def_multiplier = 7.5
    spd_multiplier = 60
    avd_multiplier = 75
    hit_multiplier = 75
    crd_multiplier = 75
    crt_multiplier = 75
    max_status = 7500

    hp_value = self[:hp] * hp_multiplier
    crt_value = self[:crt] * crt_multiplier
    crd_value = self[:crd] * crd_multiplier
    hit_value = self[:hit] * hit_multiplier
    avd_value = self[:avd] * avd_multiplier
    spd_value = self[:spd] * spd_multiplier
    def_value = self[:def] * def_multiplier
    atk_value = self[:atk] * atk_multiplier

    [
      [hp_value, max_status].min,
      [crt_value, max_status].min,
      [crd_value, max_status].min,
      [hit_value, max_status].min,
      [avd_value, max_status].min,
      [spd_value, max_status].min,
      [def_value, max_status].min,
      [atk_value, max_status].min
    ]
  end
end
