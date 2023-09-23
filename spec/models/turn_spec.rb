require 'rails_helper'

RSpec.describe Turn, type: :model do
  describe 'バリデーションの確認' do
    it 'すべての項目が有効の場合OK' do
      turn = build(:turn)
      expect(turn).to be_valid
      expect(turn.errors).to be_empty
    end

    it 'turn_numberの値が空の場合NG' do
      turn = build(:turn, turn_number: nil)
      turn.valid?
      expect(turn.errors[:turn_number]).to include(I18n.t('errors.messages.blank'))
    end

    it 'turn_numberの値が一意でない場合はNG' do
      turn = create(:turn)
      turn_compare = build(:turn, turn_number: turn.turn_number)
      turn_compare.valid?
      expect(turn_compare.errors[:turn_number]).to include(I18n.t('errors.messages.taken'))
    end
  end
end
