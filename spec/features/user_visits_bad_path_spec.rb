describe 'user visits bad path' do
  it 'they see message' do
    visit '/asdfasd'

    expect(page).to have_content("Oops...")
  end
end
