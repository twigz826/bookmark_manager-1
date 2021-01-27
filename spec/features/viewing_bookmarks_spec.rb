# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'when visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'when visiting the bookmarks page' do
    con = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    con.exec("INSERT INTO bookmarks VALUES (1, 'www.makersacademy.com', 'Makers academy');")
    con.exec("INSERT INTO bookmarks VALUES(2, 'www.destroyallsoftware.com', 'Destroy all software');")
    con.exec("INSERT INTO bookmarks VALUES(3, 'www.google.com', 'Google');")

    visit('/')

    expect(page).to have_content 'Makers academy'
    expect(page).to have_content 'Destroy all software'
    expect(page).to have_content 'Google'
  end
end
