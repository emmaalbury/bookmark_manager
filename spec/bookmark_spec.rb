require 'bookmarks'

describe Bookmark do

  describe '#view_all' do
    it 'shows a list of bookmarks' do
      con = PG.connect :dbname => 'bookmark_manager_test' # connects to empty database table to use for testing purposes - Tests should always run against an empty database.

      #adds the test data
      con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

      bookmarks = Bookmark.view_all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com')
      expect(Bookmark.view_all).to include 'http://www.testbookmark.com'
    end
  end
end
