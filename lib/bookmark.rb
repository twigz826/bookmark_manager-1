# frozen_string_literal: true

require 'pg'

# Each bookmark is an instance of the Bookmark class.
class Bookmark
  def self.all
    con = PG.connect dbname: 'bookmark_manager'
    rs = con.exec 'SELECT * FROM bookmarks'
    rs.map { |bookmark| bookmark['url'] }
  end
end
