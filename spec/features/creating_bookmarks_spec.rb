feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')

    expect(page).to have_content 'http://testbookmark.com'
  end

  scenario 'Throws error if invalid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'anything')
    click_button('Submit')
    expect(page).to have_content 'Invalid URL. Please try again.'
  end
end
