# frozen_string_literal: true

require 'pg'

# Each bookmark is an instance of the Bookmark class.
class Bookmark
  @con = if ENV['ENVIRONMENT'] == 'test'
           PG.connect dbname: 'bookmark_manager_test'
         else PG.connect dbname: 'bookmark_manager'
         end

  def self.add(new_url, new_title)
    @con.exec "INSERT INTO bookmarks (url, title) VALUES('#{new_url}', '#{new_title}')"
  end

  def self.all
    rs = @con.exec 'SELECT * FROM bookmarks'
    rs.map { |bookmark| { bookmark['title'] => bookmark['url'] } }
  end
end
