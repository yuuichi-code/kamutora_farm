class PostFormStep1
  include ActiveModel::Model

  attr_accessor :title, :first_character, :second_character, :third_character, :fourth_character, :fifth_character, :sixth_character

  validates :title, presence: true
  validates :first_character, presence: true
  validates :second_character, presence: true
  validates :third_character, presence: true
  validates :fourth_character, presence: true
  validates :fifth_character, presence: true
  validates :sixth_character, presence: true
  validate :validate_support_character_uniqueness

  private

  def validate_support_character_uniqueness
    support_characters = [
      first_character,
      second_character,
      third_character,
      fourth_character,
      fifth_character,
      sixth_character
    ]
    errors.add(:base, I18n.t('defaults.same_characters')) if support_characters.uniq.length != support_characters.length
  end
end
