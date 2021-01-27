def add_bookmark(bookmark, title)
  visit('/')
  click_button('Add link')
  fill_in :save_link, with: bookmark
  fill_in :save_title, with: title
  click_button('Save link')
end
