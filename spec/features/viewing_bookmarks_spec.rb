# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'when visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'when visiting the bookmarks page' do
    Bookmark.add(SITE_BBC_NEWS_URL, SITE_BBC_NEWS_TITLE)
    Bookmark.add(SITE_GOOGLE_URL, SITE_GOOGLE_TITLE)
    Bookmark.add(SITE_MAKERS_URL, SITE_MAKERS_TITLE)

    visit('/')
    expect(page).to have_link(SITE_BBC_NEWS_TITLE, href: SITE_BBC_NEWS_URL)
    expect(page).to have_link(SITE_GOOGLE_TITLE, href: SITE_GOOGLE_URL)
    expect(page).to have_link(SITE_MAKERS_TITLE, href: SITE_MAKERS_URL)
  end
end
