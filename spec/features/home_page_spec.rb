

feature "Testing home page" do
  scenario "has text" do
    visit '/'
    expect(page).to have_content "Hello, world!"
  end
end
