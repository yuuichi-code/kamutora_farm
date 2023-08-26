require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション確認' do
    it 'すべての項目が有効の場合OK' do
      user = build(:user)
      expect(user).to be_valid
      expect(user.errors).to be_empty
    end
    it 'nameの値がない場合NG' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to eq I18n.t('errors.messages.blank')
    end
    it 'emailの値がない場合NG' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to eq I18n.t('errors.messages.blank')
    end
    it 'passwordの値が5文字以下の場合NG' do
      user = build(:user, password: 'passw')
      user.valid?
      expect(user.errors[:password]).to eq I18n.t('errors.messages.blank')
    end
  end
end
