require 'rails_helper'

RSpec.describe SupportCharacter, type: :model do

  describe 'バリデーション確認' do
    it '重複した組み合わせの場合NG' do
      support_character1 = create(:support_character)
      duplicate_support_character = build(:support_character, post_id: support_character1.post_id, character_id: support_character1.character_id)
      duplicate_support_character.valid?
      expect(duplicate_support_character.errors[:post_id]).to include(I18n.t('errors.messages.taken'))
    end
  end
end
