# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  let(:con) { PG.connect dbname: 'bookmark_manager_test' }

  describe '.all' do
    it 'returns all bookmarks' do
      con.exec("INSERT INTO bookmarks (url, title) VALUES('#{SITE_BBC_NEWS_URL}', '#{SITE_BBC_NEWS_TITLE}')")
      con.exec("INSERT INTO bookmarks (url, title) VALUES('#{SITE_GOOGLE_URL}', '#{SITE_GOOGLE_TITLE}')")
      con.exec("INSERT INTO bookmarks (url, title) VALUES('#{SITE_MAKERS_URL}', '#{SITE_MAKERS_TITLE}')")

      expect(Bookmark.all[0].title).to include(SITE_BBC_NEWS_TITLE)
      expect(Bookmark.all[1].title).to include(SITE_GOOGLE_TITLE)
      expect(Bookmark.all[2].title).to include(SITE_MAKERS_TITLE)
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
      test_bookmark_id = Bookmark.add(SITE_HACKER_TYPER_URL, SITE_HACKER_TYPER_TITLE)
      table_bookmark = get_bookmark_from_table_by_id(test_bookmark_id)
      expect(table_bookmark.title).to eq SITE_HACKER_TYPER_TITLE
      expect(table_bookmark.url).to eq SITE_HACKER_TYPER_URL
    end
  end
end
