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

  describe 'visits /merchants' do
    it 'sees merchant header' do
      visit '/merchants'

      expect(page).to have_title 'Merchants'
    end

    it 'sees a table of all merchants' do
      visit '/merchants'

      expect(page).to have_css 'table'
    end
  end

end
