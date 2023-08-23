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
      expect(user.errors[:name]).to include("can't be blank")
    end
    it 'emailの値がない場合NG' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it 'passwordの値がない場合NG' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 3 characters)')
    end
  end
end
