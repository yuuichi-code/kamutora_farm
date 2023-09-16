require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーション確認' do
    it 'すべての項目が有効の場合OK' do
      post = build(:post)
      expect(post).to be_valid
      expect(post.errors).to be_empty
    end

    it 'titleの値がない場合NG' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include(I18n.t('errors.messages.blank'))
    end
  end
end
