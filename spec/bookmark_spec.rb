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
      test_bookmark = Bookmark.add(SITE_HACKER_TYPER_URL, SITE_HACKER_TYPER_TITLE)[0]
      id = test_bookmark['id']
      rs = get_by_id(id)
      expect(rs['title']).to eq SITE_HACKER_TYPER_TITLE
      expect(rs['url']).to eq SITE_HACKER_TYPER_URL
    end
  end

  describe '.delete' do
    it 'deletes a specific bookmark from the database' do
      bookmark = Bookmark.add(url: SITE_GOOGLE_URL, title: SITE_GOOGLE_TITLE)
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    #   con.exec "INSERT INTO bookmarks (url, title) VALUES('#{SITE_BBC_NEWS_URL}', '#{SITE_BBC_NEWS_TITLE}')"
    #   con.exec "INSERT INTO bookmarks (url, title) VALUES('#{SITE_GOOGLE_URL}', '#{SITE_GOOGLE_TITLE}')"
    #   con.exec "INSERT INTO bookmarks (url, title) VALUES('#{SITE_MAKERS_URL}', '#{SITE_MAKERS_TITLE}')"
    #
    #   test_bookmark = get_id_by_url(SITE_GOOGLE_URL)
    #
    #   Bookmark.delete(test_bookmark['id'])
    #
    #   rs = con.query "SELECT EXISTS (SELECT title FROM bookmarks WHERE title='#{test_bookmark['id']}')"
    #   expect(rs[0]['exists']).to eq 'f'
    end
  end
end
