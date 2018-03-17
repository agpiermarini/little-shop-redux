describe 'user visits individual item page' do
  context 'they visit /item/:id' do
    it 'they see item title header' do
      item = Item.create(title: 'Things',
                         description: 'Thing #1',
                         price: 5,
                         image: 'Picture of Thing #1')
      visit "/items/#{item.id}"

      expect(page).to have_content 'Things'
    end
  end

  # context 'they click on delete merchant button' do
  #   it 'they delete a merchant' do
  #     merchant = Merchant.create(name: 'Skechers')
  #     visit "/merchants/#{merchant.id}"
  #     expect(page).to have_content 'Skechers'
  #
  #     click_button 'Delete'
  #     expect(current_path).to eq('/merchants')
  #     expect(page).to_not have_content 'Skechers'
  #   end
  # end
  #
  # context 'they click on edit merchant button' do
  #   it 'they are redirected to /merchant/:id/edit' do
  #     Merchant.create(name: 'Meeeeeee', id: 3)
  #     visit '/merchants/3'
  #     click_link 'Edit'
  #
  #     expect(current_path).to eq '/merchants/3/edit'
  #   end
  # end
end
