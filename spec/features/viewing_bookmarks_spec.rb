feature "Viewing bookmarks" do
  scenario "user can view a list of bookmarks" do
    visit '/'
    click_button "View Bookmarks"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
