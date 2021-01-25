feature 'Viewing bookmarks' do
  scenario 'when visiting the index page' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
