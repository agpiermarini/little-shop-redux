require './app/controllers/little_shop_app'

describe 'user visits edit merchant page' do
  context 'they complete and submit edit merchant form' do
    it 'they edit merchant' do
      Merchant.create(name: 'Ussss', id: 12123)
      visit '/merchants/12123/edit'
      fill_in 'Name', :with => 'Youuu'
      click_button 'Update Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content 'Youuu'
    end
  end
end
