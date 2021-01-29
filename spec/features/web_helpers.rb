# frozen_string_literal: true

# Constants

SITE_BBC_NEWS_URL = 'https://www.bbc.co.uk/news'
SITE_BBC_NEWS_TITLE = 'BBC News'

SITE_GOOGLE_URL = 'https://www.google.co.uk/'
SITE_GOOGLE_TITLE = 'Google'

SITE_HACKER_TYPER_URL = 'http://www.hackertyper.com/'
SITE_HACKER_TYPER_TITLE = 'Hacker Typer'

SITE_MAKERS_URL = 'https://www.makersacademy.com/'
SITE_MAKERS_TITLE = 'Makers Academy'

# Feature Test Web Helpers

def add_bookmark_feature(bookmark, title)
  visit('/bookmarks')
  click_button('Add Bookmark')
  fill_in :save_link, with: bookmark
  fill_in :save_title, with: title
  click_button('Save Bookmark')
end

# Unit Test Web Helpers

def get_by_id(id)
  con = PG.connect dbname: 'bookmark_manager_test'
  con.query("SELECT * FROM bookmarks WHERE id = '#{id}'")[0]
end

def get_id_by_url(url)
  con = PG.connect dbname: 'bookmark_manager_test'
  con.query("SELECT * FROM bookmarks WHERE url = '#{url}'")[0]
end
