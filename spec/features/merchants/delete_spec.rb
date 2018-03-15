require './app/controllers/little_shop_app'


RSpec.describe 'User' do
  describe 'clicks delete merchant button' do
    it 'sees new merchant index without that merchant' do
      Merchant.create(name: 'Skechers', id: 7)
      visit '/merchants'
      expect(page).to have_content 'Skechers'

      click_button 'Delete'
      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content 'Skechers'
    end
  end

    # it 'can create new merchant' do
    #   visit '/merchants'
    #   click_button 'Create a New Merchant'
    #   fill_in 'Name', :with => 'Toms'
    #   click_button 'Create Merchant'
    #
    #   current_path.should == '/merchants'
    #   expect(page).to have_content 'Toms'
    # end


  # describe 'clicks on little shop link' do
  #   it 'is redirected to index path' do
  #     visit '/merchants'
  #     click_link('LittleShop')
  #
  #     current_path.should == '/'
  #   end
  # end
end
