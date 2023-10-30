require 'rails_helper'

RSpec.describe "PostFormStep1", type: :system do
  let(:user) { create(:user) }

  before do
    @character_list = create_list(:character, 7)
  end

  describe 'ログイン前' do
    context 'ページにアクセス' do
      it 'ログイン画面に遷移する' do
        visit step1_path
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    context 'すべての入力値が正常' do
      it '次のステップに遷移して、選択した修行仲間が表示される' do
        login(user)
        visit step1_path
        fill_in 'タイトル', with: 'test_title'
        find('#post_form_step1_training_character').find("option[value='1']").select_option
        find('#post_form_step1_first_character').find("option[value='2']").select_option
        find('#post_form_step1_second_character').find("option[value='3']").select_option
        find('#post_form_step1_third_character').find("option[value='4']").select_option
        find('#post_form_step1_fourth_character').find("option[value='5']").select_option
        find('#post_form_step1_fifth_character').find("option[value='6']").select_option
        find('#post_form_step1_sixth_character').find("option[value='7']").select_option
        click_on '次へ'
        expect(page).to have_content '1の巻の内容を入力してください'
        expect(page).to have_current_path step2_path
      end
    end

    context 'タイトルが未入力の場合' do
      it '次のステップへは遷移せずに、再度入力画面が表示される' do
        login(user)
        visit step1_path
        fill_in 'タイトル', with: nil
        find('#post_form_step1_training_character').find("option[value='1']").select_option
        find('#post_form_step1_first_character').find("option[value='2']").select_option
        find('#post_form_step1_second_character').find("option[value='3']").select_option
        find('#post_form_step1_third_character').find("option[value='4']").select_option
        find('#post_form_step1_fourth_character').find("option[value='5']").select_option
        find('#post_form_step1_fifth_character').find("option[value='6']").select_option
        find('#post_form_step1_sixth_character').find("option[value='7']").select_option
        click_on '次へ'
        expect(page).to have_content PostFormStep1.human_attribute_name(:title) + I18n.t('errors.messages.blank')
        expect(page).to have_current_path step1_path
      end
    end

    context '育成キャラクターが未選択の場合' do
      it '次のステップへは遷移せずに、再度入力画面が表示される' do
        login(user)
        visit step1_path
        fill_in 'タイトル', with: 'test_title'
        find('#post_form_step1_training_character').find("option[value='']").select_option
        find('#post_form_step1_first_character').find("option[value='2']").select_option
        find('#post_form_step1_second_character').find("option[value='3']").select_option
        find('#post_form_step1_third_character').find("option[value='4']").select_option
        find('#post_form_step1_fourth_character').find("option[value='5']").select_option
        find('#post_form_step1_fifth_character').find("option[value='6']").select_option
        find('#post_form_step1_sixth_character').find("option[value='7']").select_option
        click_on '次へ'
        expect(page).to have_content PostFormStep1.human_attribute_name(:training_character) + I18n.t('errors.messages.blank')
        expect(page).to have_current_path step1_path
      end
    end

    context '育成キャラクター選択と修行仲間の選択が重複している場合' do
      it '次のステップへは遷移せずに、再度入力画面が表示される' do
        login(user)
        visit step1_path
        fill_in 'タイトル', with: 'test_title'
        find('#post_form_step1_training_character').find("option[value='1']").select_option
        find('#post_form_step1_first_character').find("option[value='1']").select_option
        find('#post_form_step1_second_character').find("option[value='3']").select_option
        find('#post_form_step1_third_character').find("option[value='4']").select_option
        find('#post_form_step1_fourth_character').find("option[value='5']").select_option
        find('#post_form_step1_fifth_character').find("option[value='6']").select_option
        find('#post_form_step1_sixth_character').find("option[value='7']").select_option
        click_on '次へ'
        expect(page).to have_content I18n.t('defaults.same_training_characters')
        expect(page).to have_current_path step1_path
      end
    end

    context '修行仲間の選択が重複している場合' do
      it '次のステップへは遷移せずに、再度入力画面が表示される' do
        login(user)
        visit step1_path
        fill_in 'タイトル', with: 'test_title'
        find('#post_form_step1_training_character').find("option[value='1']").select_option
        find('#post_form_step1_first_character').find("option[value='2']").select_option
        find('#post_form_step1_second_character').find("option[value='2']").select_option
        find('#post_form_step1_third_character').find("option[value='4']").select_option
        find('#post_form_step1_fourth_character').find("option[value='5']").select_option
        find('#post_form_step1_fifth_character').find("option[value='6']").select_option
        find('#post_form_step1_sixth_character').find("option[value='7']").select_option
        click_on '次へ'
        expect(page).to have_content I18n.t('defaults.same_characters')
        expect(page).to have_current_path step1_path
      end
    end
  end
end
