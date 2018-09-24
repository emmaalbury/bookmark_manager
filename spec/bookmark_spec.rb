require 'bookmarks'

describe Bookmarks do

  let(:bookmark) { described_class.new }

  describe '#view_all' do
    it 'shows a list of bookmarks' do
      bookmarks = Bookmarks.view_all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
