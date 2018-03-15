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
      visit '/merchants'
      click_button('Create a New Merchant')

      current_path.should == '/merchants/new'
    end
  end

  describe 'clicks on buttons of /merchants' do

    it 'clicks the edit merchant buttton' do
      Merchant.create(name: "Meeeeeee", id: 3)
        visit '/merchants'
        click_button('Edit')

        current_path.should == '/merchants/3/edit'
    end
  end

  describe 'clicks on buttons of /merchants' do
    it 'clicks the delete merchant buttton' do
      Merchant.create(name: "Youuuuuu", id: 34)
        visit '/merchants'
        click_button('Delete')

        current_path.should == '/merchants'
    end
  end
end
