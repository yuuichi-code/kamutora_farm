require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'バリデーション確認' do
    it 'すべての項目が有効の場合OK' do
      character = build(:character)
      expect(character).to be_valid
      expect(character.errors).to be_empty
    end

    it 'nameの値がない場合NG' do
      character = build(:character, name: nil)
      character.valid?
      expect(character.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end

    it 'nameの値が一意でない場合NG' do
      character1 = create(:character)
      character2 = build(:character, name: character1.name)
      character2.valid?
      expect(character2.errors[:name]).to include(I18n.t('errors.messages.taken'))
    end

    it 'unit_elementの値がない場合NG' do
      character = build(:character, unit_element: nil)
      character.valid?
      expect(character.errors[:unit_element]).to include(I18n.t('errors.messages.blank'))
    end

    it 'initial_rarityの値がない場合NG' do
      character = build(:character, initial_rarity: nil)
      character.valid?
      expect(character.errors[:initial_rarity]).to include(I18n.t('errors.messages.blank'))
    end
  end
end
