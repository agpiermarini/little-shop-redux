require './app/controllers/little_shop_app'

RSpec.describe 'User' do
  describe 'clicks create merchant button' do
    it 'sees new merchant page title' do
      visit '/merchants'
      click_button 'Create a New Merchant'

      expect(page).to have_content 'Create New Merchant'
    end

    it 'can create new merchant' do
      visit '/merchants'
      click_button 'Create a New Merchant'
      fill_in 'Name', :with => 'Toms'
      click_button 'Create Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content 'Toms'
    end

    it 'can cancel' do
      visit '/merchants'
      click_button 'Create a New Merchant'
      click_button 'Cancel'

      expect(current_path).to eq('/merchants')
    end
  end
end
