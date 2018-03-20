describe 'user visits homepage' do
  it 'they see little shop logo' do
    visit '/'

    expect(page).to have_css("img[src*='shop-logo.png']")
    expect(page).to_not have_content("Oops")
  end
end
