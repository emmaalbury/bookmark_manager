require 'bookmarks'

describe Bookmark do

  describe '#view_all' do
    it 'shows a list of bookmarks' do
      # con = PG.connect(dbname: 'bookmark_manager_test') # connects to empty database table to use for testing purposes - Tests should always run against an empty database.
      Bookmark.create(url: 'http://www.makersacademy.com', title: "Makers Academy")
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: "Destroy All Software")
      Bookmark.create(url: 'http://www.google.com', title: "Google")

      bookmarks = Bookmark.view_all
      bookmark = Bookmark.view_all.first
      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq "Makers Academy"
      expect(bookmark.url).to eq "http://www.makersacademy.com"
      # expect(bookmarks).to include("http://www.makersacademy.com")
      # expect(bookmarks).to include("http://www.destroyallsoftware.com")
      # expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmarks')
      expect(bookmark).to be_a Bookmark
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq "Test Bookmarks"
    end

    it 'throws error if URL is invalid' do
      Bookmark.create(url: 'testbookmark.com', title: 'Test Bookmarks')
      expect(Bookmark.view_all).not_to include 'Test Bookmarks'
    end
  end
  describe '.delete' do
    it 'deletes a bookmark' do
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      expect(Bookmark.delete('http://www.google.com')).not_to include 'Google'
    end
  end
end
