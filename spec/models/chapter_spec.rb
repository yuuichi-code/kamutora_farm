require 'rails_helper'

RSpec.describe Chapter, type: :model do
  describe 'バリデーションの確認' do
    it 'すべての項目が有効の場合OK' do
      chapter = build(:chapter)
      expect(chapter).to be_valid
      expect(chapter.errors).to be_empty
    end

    it 'chapter_numberの値が空の場合NG' do
      chapter = build(:chapter, chapter_number: nil)
      chapter.valid?
      expect(chapter.errors[:chapter_number]).to include(I18n.t('errors.messages.blank'))
    end

    it 'chapter_numberの値が一意でない場合はNG' do
      chapter = create(:chapter)
      chapter_compare = build(:chapter, chapter_number: chapter.chapter_number)
      chapter_compare.valid?
      expect(chapter_compare.errors[:chapter_number]).to include(I18n.t('errors.messages.taken'))
    end
  end
end
