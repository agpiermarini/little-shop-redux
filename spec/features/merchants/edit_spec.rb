require './app/controllers/little_shop_app'

RSpec.describe 'User' do
  describe 'clicks merchant edit button' do
    it 'sees merchant details in page header' do
      Merchant.create(name: "Ussss", id: 12123)
      visit '/merchants'
      click_button 'Edit'

      expect(current_path).to eq '/merchants/12123/edit'
      expect(page).to have_content 'Edit Ussss'
    end

    it 'can edit merchant' do
      Merchant.create(name: "Ussss", id: 12123)
      visit '/merchants'
      click_button 'Edit'
      fill_in 'Name', :with => 'Youuu'
      click_button 'Update Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content 'Youuu'
    end
    #   it 'can cancel' do
    #     visit '/merchants'
    #     click_button 'Create a New Merchant'
    #     click_button 'Cancel'
    #
    #     expect(current_path).to eq('/merchants')
    #   end
    # end
  end
end
