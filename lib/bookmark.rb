# frozen_string_literal: true

require 'pg'

# Each bookmark is an instance of the Bookmark class.
class Bookmark
  def self.all
    con = if ENV['ENVIRONMENT'] == 'test'
            PG.connect dbname: 'bookmark_manager_test'
          else
            PG.connect dbname: 'bookmark_manager'
          end
    rs = con.exec 'SELECT * FROM bookmarks'
    rs.map { |bookmark| bookmark['url'] }
  end
end
