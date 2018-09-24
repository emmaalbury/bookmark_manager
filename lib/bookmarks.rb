require 'pg'

class Bookmarks

  def self.view_all
    con = PG.connect :dbname => 'bookmark_manager', :user => 'darciewalsh'
    rs = con.exec "SELECT * FROM bookmarks"
      rs.map do |row|
        row['url']
      end
  end

end
