# frozen_string_literal: true

feature 'Adding a bookmark' do
  scenario 'user clicks add link button' do
    visit('/')
    click_button('Add link')
    expect(page).to have_content 'Add link'
  end
end
