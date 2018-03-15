require './app/controllers/little_shop_app'

RSpec.describe 'User' do
  describe 'visits /merchants' do
    it 'sees merchant title' do
      visit '/merchants'

      expect(page).to have_title 'Merchants'
    end
  end

  describe 'clicks on create merchant button' do
    it 'is redirected to new merchant path' do
      visit '/merchants'
      click_button('Create a New Merchant')

      current_path.should == '/merchants/new'
    end
  end

  describe 'clicks on individual merchant link' do
    it 'is redirected to individual merchant path' do
      Merchant.create(name: "Youuuuuu", id: 34)
      visit '/merchants'
      click_link('Youuuuuu')

      current_path.should == '/merchants/34'
    end
  end

  describe 'clicks on edit merchant button' do
    it 'is redirected to edit merchant path' do
      Merchant.create(name: "Meeeeeee", id: 3)
        visit '/merchants'
        click_button('Edit')

        current_path.should == '/merchants/3/edit'
    end
  end

  describe 'clicks on delete merchant button' do
    it 'is redirected to delete merchant path' do
      Merchant.create(name: "Youuuuuu", id: 34)
      visit '/merchants'
      click_button('Delete')

      current_path.should == '/merchants/34/delete'
    end
  end
end
