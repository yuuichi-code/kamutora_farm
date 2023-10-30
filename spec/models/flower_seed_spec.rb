require 'rails_helper'

RSpec.describe FlowerSeed, type: :model do
  describe 'バリデーション確認' do
    it 'すべての項目が有効の場合OK' do
      flower_seed = build(:flower_seed)
      expect(flower_seed).to be_valid
      expect(flower_seed.errors).to be_empty
    end

    it 'nameの値がない場合NG' do
      flower_seed = build(:flower_seed, name: nil)
      flower_seed.valid?
      expect(flower_seed.errors[:name]).to include(I18n.t('errors.messages.blank'))
    end

    it 'nameの値が一意でない場合NG' do
      flower_seed = create(:flower_seed)
      duplicate_flower_seed = build(:flower_seed, name: flower_seed.name)
      duplicate_flower_seed.valid?
      expect(duplicate_flower_seed.errors[:name]).to include(I18n.t('errors.messages.taken'))
    end
  end
end
