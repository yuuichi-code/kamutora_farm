require 'rails_helper'

RSpec.describe Action, type: :model do
  describe 'バリデーション確認' do
    it 'すべての項目が有効の場合OK' do
      action = build(:action)
      expect(action).to be_valid
      expect(action.errors).to be_empty
    end

    it 'contentの値がない場合NG' do
      action = build(:action, content: nil)
      action.valid?
      expect(action.errors[:content]).to include(I18n.t('errors.messages.blank'))
    end

    it 'contentの値が一意でない場合NG' do
      action = create(:action)
      duplicate_action = build(:action, content: action.content)
      duplicate_action.valid?
      expect(duplicate_action.errors[:content]).to include(I18n.t('errors.messages.taken'))
    end
  end
end
