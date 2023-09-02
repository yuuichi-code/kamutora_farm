require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe 'ユーザー新規登録' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規作成が成功する' do
        visit new_user_path
        fill_in '名前', with: 'test'
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード再入力', with: 'password'
        click_button I18n.t('defaults.register')
        expect(page).to have_content I18n.t('users.create.success')
        expect(current_path).to eq root_path
        expect(page).to have_content I18n.t('defaults.logout')
      end
    end

    context '名前が未入力の場合' do
      it 'ユーザー登録が失敗する' do
        visit new_user_path
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード再入力', with: 'password'
        click_button I18n.t('defaults.register')
        expect(page).to have_content I18n.t('users.create.fail')
        expect(page).to have_content User.human_attribute_name(:name) + I18n.t('errors.messages.blank')
        expect(current_path).to eq new_user_path
      end
    end

    context 'メールアドレスが未入力の場合' do
      it 'ユーザー登録が失敗する' do
        visit new_user_path
        fill_in '名前', with: 'test'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード再入力', with: 'password'
        click_button I18n.t('defaults.register')
        expect(page).to have_content I18n.t('users.create.fail')
        expect(page).to have_content User.human_attribute_name(:email) + I18n.t('errors.messages.blank')
        expect(current_path).to eq new_user_path
      end
    end

    context '登録済みのメールアドレスを使用した場合' do
      it 'ユーザー登録が失敗する' do
        existed_user = create(:user)
        visit new_user_path
        fill_in '名前', with: 'test'
        fill_in 'メールアドレス', with: existed_user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード再入力', with: 'password'
        click_button I18n.t('defaults.register')
        expect(page).to have_content I18n.t('users.create.fail')
        expect(page).to have_content User.human_attribute_name(:email) + I18n.t('errors.messages.taken')
        expect(current_path).to eq new_user_path
        expect(page).to have_field 'メールアドレス', with: existed_user.email
      end
    end
  end
end
