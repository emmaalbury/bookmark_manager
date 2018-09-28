require 'pg'

feature "Viewing bookmarks" do
  scenario "user can view a list of bookmarks" do
    # con = PG.connect :dbname => 'bookmark_manager_test'
    #
    # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    # con.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit '/'
    click_button "View Bookmarks"
    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy All Software"
    expect(page).to have_content "Google"
  end
end
