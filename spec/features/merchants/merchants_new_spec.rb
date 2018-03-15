require './app/controllers/little_shop_app'

RSpec.describe 'User' do
  describe 'clicks create merchant button' do
    it 'sees new merchant page title' do
      visit '/merchants'
      click_button 'Create a New Merchant'

      expect(page).to have_content 'Create New Merchant'
    end
  end

    it 'can create new merchant' do
      visit '/merchants'
      click_button 'Create a New Merchant'
      fill_in 'Name', :with => 'Toms'
      click_button 'Create Merchant'

      current_path.should == '/merchants'
      expect(page).to have_content 'Toms'
    end


  # describe 'clicks on little shop link' do
  #   it 'is redirected to index path' do
  #     visit '/merchants'
  #     click_link('LittleShop')
  #
  #     current_path.should == '/'
  #   end
  # end
end
