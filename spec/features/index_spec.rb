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

#   it 'should display welcome message' do
#     get '/'
#
#     expect(last_response.body).to include('Welcome!')
#   end
#
#   it 'should have merchant index' do
#     get '/merchants'
#
#     expect(last_response.body).to include('Merchants')
#   end
# end
