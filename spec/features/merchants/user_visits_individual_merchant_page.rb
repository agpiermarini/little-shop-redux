describe 'user visits individual merchant page' do
  context 'they click on delete merchant button' do
    it 'they delete a merchant' do
      merchant = Merchant.create(name: 'Skechers')
      visit "/merchants/#{merchant.id}"
      expect(page).to have_content 'Skechers'

      click_button 'Delete'
      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content 'Skechers'
    end
  end
end
