require 'spec_helper'

feature 'Article Management :' do
  given(:user) { create(:user) }

  scenario 'Navigation available to user articles' do
    visit "users/#{user.id}/articles"

    current_path.should be == user_articles_path(user)
  end

  scenario 'User creates a new article successfully' do
    create_article('title')

    expect(page).to have_text("Article was successfully created.")
  end

  scenario 'User failed to create a new article' do
    create_article(nil)

    current_path.should be == user_articles_path(user)
  end

  private

  def create_article title
    sign_in user

    visit root_url

    visit "users/#{user.id}/articles/new"

    fill_in 'article[title]', with: title

    click_button 'Create Article'
  end
end
