# frozen_string_literal: true

require 'pg'

# Each bookmark is an instance of the Bookmark class.
class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @title = title
    @url = url
  end

  @con = if ENV['ENVIRONMENT'] == 'test'
           PG.connect dbname: 'bookmark_manager_test'
         else PG.connect dbname: 'bookmark_manager'
         end

  def self.all
    rs = @con.exec 'SELECT * FROM bookmarks'
    rs.map { |bookmark| Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  end

  def self.add(url, title)
    @con.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING *")
  end

  def self.delete(id)
    @con.exec("DELETE FROM bookmarks WHERE id=#{id}")
  end
end
