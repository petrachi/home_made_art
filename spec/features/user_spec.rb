require 'spec_helper'

feature 'User :' do
  given(:user) { create(:user) }

  scenario 'Sign in' do
    sign_in user

    current_path.should be == user_path(user)
  end

  scenario 'Sign out' do
    sign_in user

    visit root_url
    visit 'sign_out'

    expect(page).to have_text I18n.t('account.sign_out')
  end
end
