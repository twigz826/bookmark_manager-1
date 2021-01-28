# frozen_string_literal: true

SITE_BBC_NEWS_URL = 'https://www.bbc.co.uk/news'
SITE_BBC_NEWS_TITLE = 'BBC News'

SITE_GOOGLE_URL = 'https://www.google.co.uk/'
SITE_GOOGLE_TITLE = 'Google'

SITE_HACKER_TYPER_URL = 'http://www.hackertyper.com/'
SITE_HACKER_TYPER_TITLE = 'Hacker Typer'

SITE_MAKERS_URL = 'https://www.makersacademy.com/'
SITE_MAKERS_TITLE = 'Makers Academy'

def add_bookmark(bookmark, title)
  visit('/')
  click_button('Add Bookmark')
  fill_in :save_link, with: bookmark
  fill_in :save_title, with: title
  click_button('Save Bookmark')
end
