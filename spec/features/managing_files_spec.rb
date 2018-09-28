require 'pg'

feature 'deletes bookmark' do
  scenario 'Navigates to delete page' do
    visit('/bookmarks')
    click_button('Delete')
    expect(page).to have_content "Delete bookmark"
  end

  scenario 'Deletes users bookmark' do
    Bookmark.create(url: "http://www.google.com", title: "Google")
    visit('/bookmarks')
    click_button('Delete')
    fill_in('url', with: "http://www.google.com")
    click_button('Delete')
    expect(page).to_not have_content "Google"
  end
end
