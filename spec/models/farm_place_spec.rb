require 'rails_helper'

RSpec.describe FarmPlace, type: :model do
  describe 'バリデーションの確認' do
    it 'すべての項目が有効の場合OK' do
      farm_place = build(:farm_place)
      expect(farm_place).to be_valid
      expect(farm_place.errors).to be_empty
    end

    it 'farm_numberの値が空の場合NG' do
      farm_place = build(:farm_place, farm_number: nil)
      farm_place.valid?
      expect(farm_place.errors[:farm_number]).to include(I18n.t('errors.messages.blank'))
    end

    it 'farm_numberの値が一意でない場合はNG' do
      farm_place = create(:farm_place)
      duplicate_farm_place = build(:farm_place, farm_number: farm_place.farm_number)
      duplicate_farm_place.valid?
      expect(duplicate_farm_place.errors[:farm_number]).to include(I18n.t('errors.messages.taken'))
    end
  end
end
