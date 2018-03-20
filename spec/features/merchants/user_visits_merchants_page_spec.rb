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
      click_link 'Little Shop'

      expect(current_path).to eq('/')
    end
  end

  context 'they click on merchants link' do
    it 'they are redirected to /merchants' do
      visit '/merchants'
      click_link 'Merchants'

      expect(current_path).to eq('/merchants')
    end
  end

  context 'they click on items link' do
    it 'they are redirected to /items' do
      visit '/merchants'
      click_link 'Items'

      expect(current_path).to eq('/items')
    end
  end

  context 'they click on invoices link' do
    it 'they are redirected to /invoices' do
      visit '/merchants'
      click_link 'Invoices'

      expect(current_path).to eq('/invoices')
    end
  end

  context 'they click on create merchant link' do
    it 'they are redirected to /merchants/new' do
      visit '/merchants'
      click_link 'Create a New Merchant'

      expect(page).to have_content 'Create New Merchant'
      expect(current_path).to eq('/merchants/new')
    end
  end

  context 'they click on individual merchant link' do
    it 'they are redirected to individual merchant path' do
      merchant = Merchant.create(name: 'Youuuuuu')
      visit '/merchants'
      click_link 'Youuuuuu'

      expect(current_path).to eq("/merchants/#{merchant.id}")
    end
  end

  context 'they click on edit merchant link' do
    it 'they are redirected to /merchant/:id/edit' do
      merchant = Merchant.create(name: 'Meeeeeee')
      visit '/merchants'
      click_link 'Edit'

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
    end
  end

  context 'they click on delete merchant button' do
    it 'they delete a merchant' do
      Merchant.create(name: 'Skechers')
      visit '/merchants'
      expect(page).to have_content 'Skechers'

      click_button 'Delete'
      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content 'Skechers'
    end
  end
end
