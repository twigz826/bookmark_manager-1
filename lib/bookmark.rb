# frozen_string_literal: true

require 'pg'

# Each bookmark is an instance of the Bookmark class.
class Bookmark
  attr_reader :id, :url, :title

  @con = if ENV['ENVIRONMENT'] == 'test'
           PG.connect dbname: 'bookmark_manager_test'
         else PG.connect dbname: 'bookmark_manager'
         end

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.add(new_url, new_title)
    result = @con.exec("INSERT INTO bookmarks (url, title) VALUES('#{new_url}', '#{new_title}') RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

  def self.all
    rs = @con.exec 'SELECT * FROM bookmarks'
    rs.map { |bookmark| Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  end
end
