describe 'user visits individual merchant page' do
  context 'they click on delete merchant button' do
    it 'they delete a merchant' do
      Merchant.create(name: 'Skechers', id: 7)
      visit '/merchants/7'
      expect(page).to have_content 'Skechers'

      click_button 'Delete'
      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content 'Skechers'
    end
  end

  context 'they click on edit merchant button' do
    it 'they are redirected to /merchant/:id/edit' do
      Merchant.create(name: 'Meeeeeee', id: 3)
      visit '/merchants/3'
      click_link 'Edit'

      expect(current_path).to eq '/merchants/3/edit'
    end
  end
end
