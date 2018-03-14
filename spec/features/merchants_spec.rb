require './app/controllers/little_shop_app'

RSpec.describe 'User' do
  describe 'visits /merchants' do
    it 'sees merchant title' do
      visit '/merchants'

      expect(page).to have_title 'Merchants'
    end
  end

  describe 'clicks on buttons of /merchants' do
    it 'clicks the create merchant buttton' do
      click_button('Create a New Merchant')

      current_path.should == '/merchants/new'
    end

    it 'clicks the edit merchant buttton' do
      within('div') do
        click_button('Edit')

        current_path.should == '/merchants/:id/edit'
      end
    end

    # it 'clicks the edit merchant buttton' do
    #   click_button('edit merchant')
    #
    #   current_path.should == '/merchants/:id/edit'
    # end
  end
end
