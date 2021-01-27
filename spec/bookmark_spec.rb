# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      con = PG.connect dbname: 'bookmark_manager_test'

      con.exec("INSERT INTO bookmarks VALUES (1, 'www.makersacademy.com', 'Makers academy');")
      con.exec("INSERT INTO bookmarks VALUES(2, 'www.destroyallsoftware.com', 'Destroy all software');")
      con.exec("INSERT INTO bookmarks VALUES(3, 'www.google.com', 'Google');")

      expect(Bookmark.all).to include('Makers academy')
      expect(Bookmark.all).to include('Destroy all software')
      expect(Bookmark.all).to include('Google')
    end
  end

  describe '.add' do
    it 'adds a bookmark to the database' do
      Bookmark.add('http://www.hackertyper.com', 'Hacker Typer')
      expect(Bookmark.all).to include('Hacker Typer')
    end
  end
end
