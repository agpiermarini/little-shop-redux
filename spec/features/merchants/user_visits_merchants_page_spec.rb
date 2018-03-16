require './app/controllers/little_shop_app'

describe 'user visits merchants list page' do
  context 'they visit /merchants' do
    it 'they see a merchant header' do
      visit '/merchants'

      expect(page).to have_content 'Merchants'
    end
  end

  context 'they click on little shop link' do
    it 'they are redirected to /' do
      visit '/merchants'
      click_link 'LittleShop'

      current_path.should == '/'
    end
  end

  context 'they click on merchants link' do
    it 'they are redirected to /merchants' do
      visit '/merchants'
      click_link 'Merchants'

      current_path.should == '/merchants'
    end
  end

  context 'they click on items link' do
    it 'they are redirected to /items' do
      visit '/merchants'
      click_link 'Items'

      current_path.should == '/items'
    end
  end

  context 'they click on invoices link' do
    it 'they are redirected to /invoices' do
      visit '/merchants'
      click_link 'Invoices'

      current_path.should == '/invoices'
    end
  end

  context 'they click on create merchant button' do
    it 'they are redirected to /merchants/new' do
      visit '/merchants'
      click_link 'Create a New Merchant'

      expect(page).to have_content 'Create New Merchant'
      current_path.should == '/merchants/new'
    end
  end

  context 'they click on individual merchant link' do
    it 'they are redirected to individual merchant path' do
      Merchant.create(name: 'Youuuuuu', id: 34)
      visit '/merchants'
      click_link 'Youuuuuu'

      current_path.should == '/merchants/34'
    end
  end

  context 'they click on edit merchant button' do
    it 'they are redirected to /merchant/:id/edit' do
      Merchant.create(name: 'Meeeeeee', id: 3)
      visit '/merchants'
      click_link 'Edit'

      current_path.should == '/merchants/3/edit'
    end
  end

  context 'they click on delete merchant button' do
    it 'they delete a merchant' do
      Merchant.create(name: 'Skechers', id: 7)
      visit '/merchants'
      expect(page).to have_content 'Skechers'

      click_button 'Delete'
      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content 'Skechers'
    end
  end
end
