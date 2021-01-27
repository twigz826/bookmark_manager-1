# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      con = PG.connect dbname: 'bookmark_manager_test'

      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      expect(Bookmark.all).to include('http://www.makersacademy.com')
      expect(Bookmark.all).to include('http://www.destroyallsoftware.com')
      expect(Bookmark.all).to include('http://www.google.com')
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
      Bookmark.add('http://www.hackertyper.com')
      expect(Bookmark.all).to include('http://www.hackertyper.com')
    end
  end
end
