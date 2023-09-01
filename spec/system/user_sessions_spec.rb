require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context '入力値が正常' do
      it 'ログインが成功する' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content I18n.t('user_sessions.create.success')
      end
    end

    context 'パスワードが未入力の場合' do
      it 'ログインが失敗する' do
        visit login_path
        fill_in 'パスワード', with: user.email
        fill_in 'パスワード', with: nil
        click_button 'ログイン'
        expect(page).to have_content I18n.t('user_sessions.create.fail')
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウトが成功する' do
        login(user)
        click_on 'ログアウト'
        expect(page).to have_content I18n.t('user_sessions.destroy.success')
        expect(page).to have_current_path root_path
      end
    end
  end
end
