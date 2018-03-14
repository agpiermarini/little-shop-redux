require './app/controllers/little_shop_app'

RSpec.describe 'User' do
  describe 'visits /' do
    it 'sees the homepage' do
      visit '/'

      within('h1') do
        expect(page).to have_content('Welcome!')
      end
    end
  end
end
