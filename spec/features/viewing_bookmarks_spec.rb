# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'when visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'when visiting the bookmarks page' do
    visit('/bookmarks')
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
