require './app/controllers/little_shop_app'

describe 'user visits homepage' do
  context 'they visit /' do
    it 'they see a welcome message' do
      visit '/'

      expect(page).to have_content 'Welcome!'
    end
  end
end
