# frozen_string_literal: true

feature 'Deleting a bookmark' do
  scenario 'user adds a bookmark and deletes it' do
    add_bookmark_feature(SITE_GOOGLE_URL, SITE_GOOGLE_TITLE)

    visit('/bookmarks')
    expect(page).to have_link(SITE_GOOGLE_TITLE, href:SITE_GOOGLE_URL)

    first('.bookmark').click_button("Delete")

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link(SITE_GOOGLE_TITLE, href:SITE_GOOGLE_URL)

  end
end
