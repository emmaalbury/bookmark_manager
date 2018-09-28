feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end

  scenario 'Throws error if invalid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'anything')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_content 'Invalid URL. Please try again.'
  end
end
