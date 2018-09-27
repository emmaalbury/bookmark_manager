require 'pg'

feature "Viewing bookmarks" do
  scenario "user can view a list of bookmarks" do
    # con = PG.connect :dbname => 'bookmark_manager_test'
    #
    # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    Bookmark.create(url: "http://www.makersacademy.com")
    Bookmark.create(url: "http://www.destroyallsoftware.com")
    Bookmark.create(url: "http://www.google.com")

    visit '/'
    click_button "View Bookmarks"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
