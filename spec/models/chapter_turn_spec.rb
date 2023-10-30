require 'rails_helper'

RSpec.describe ChapterTurn, type: :model do
  let(:chapter) { create(:chapter) }
  let(:turn) { create(:turn) }

  describe 'バリデーション確認' do
    it 'chapter_idとturn_idの組み合わせが重複した場合NG' do
      chapter_turn = create(:chapter_turn)
      duplicate_chapter_turn = build(:chapter_turn, chapter_id: chapter_turn.chapter_id, turn_id: chapter_turn.turn_id)
      duplicate_chapter_turn.valid?
      expect(duplicate_chapter_turn.errors[:chapter_id]).to include(I18n.t('errors.messages.taken'))
    end

    it 'chapter_idの値がない場合NG' do
      chapter_turn = build(:chapter_turn, chapter_id: nil, turn_id: turn.id)
      expect(chapter_turn).to be_invalid
    end

    it 'turn_idの値がない場合NG' do
      chapter_turn = build(:chapter_turn, chapter_id: chapter.id, turn_id: nil)
      expect(chapter_turn).to be_invalid
    end
  end
end
