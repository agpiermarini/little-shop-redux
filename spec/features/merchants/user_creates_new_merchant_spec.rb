require './app/controllers/little_shop_app'

describe 'user visits create new merchant page' do
  context 'they complete and submit new merchant form' do
    it 'they create new merchant' do
      visit '/merchants/new'
      fill_in 'Name', :with => 'Toms'
      click_button 'Create Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content 'Toms'
    end
  end

  context 'they cancel new merchant creation' do
    it 'they return to merchants' do
      visit '/merchants/new'
      click_link 'Cancel'

      expect(current_path).to eq('/merchants')
    end
  end
end
