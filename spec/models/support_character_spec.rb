require 'rails_helper'

RSpec.describe SupportCharacter, type: :model do
  let(:character) { create(:character) }
  let(:post) { create(:post) }

  describe 'バリデーション確認' do
    it 'post_idとcharacter_idの組み合わせが重複した場合NG' do
      support_character1 = create(:support_character)
      duplicate_support_character = build(:support_character, post_id: support_character1.post_id, character_id: support_character1.character_id)
      duplicate_support_character.valid?
      expect(duplicate_support_character.errors[:post_id]).to include(I18n.t('errors.messages.taken'))
    end

    it 'post_idの値がない場合NG' do
      support_character = build(:support_character, post_id: nil, character_id: character.id)
      expect(support_character).to be_invalid
    end

    it 'character_idの値がない場合NG' do
      support_character = build(:support_character, post_id: post.id, character_id: nil)
      expect(support_character).to be_invalid
    end
  end
end
