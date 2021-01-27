# frozen_string_literal: true

feature 'Adding a bookmark' do
  scenario 'user clicks add link button' do
    visit('/')
    click_button('Add link')
    expect(page).to have_content 'Add link'
  end

  scenario 'adds new link' do
    visit('/')
    click_button('Add link')
    fill_in :save_link, with: 'http://www.hackertyper.com'
    click_button('Save link')
    expect(page).to have_content 'http://www.hackertyper.com'
  end
end
