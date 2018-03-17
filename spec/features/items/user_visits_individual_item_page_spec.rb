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

  context 'they click on delete item button' do
    it 'they delete an item' do
      item = Item.create(title: 'Things',
                         description: 'Thing #1',
                         price: 5,
                         image: 'Picture of Thing #1')
      visit "/items/#{item.id}"
      click_button 'Delete'

      expect(current_path).to eq('/items')
      expect(page).to_not have_content 'Things'
    end
  end

  context 'they click on edit item button' do
    it 'they are redirected to /item/:id/edit' do
      item = Item.create(title: 'Things',
                         description: 'Thing #1',
                         price: 5,
                         image: 'Picture of Thing #1')
      visit "/items/#{item.id}"
      click_link 'Edit'

      expect(current_path).to eq "/items/#{item.id}/edit"
    end
  end

  context 'they click on merchant title link' do
    it 'they are redirected to /merchant/:id/' do
      merchant = Merchant.create(name: 'Youuuuuu')
      item = Item.create(title: 'Things',
                         description: 'Thing #1',
                         price: 5,
                         image: 'Picture of Thing #1',
                         merchant_id: 1)
      visit "/items/#{item.id}"
      click_link 'Youuuuuu'

      expect(current_path).to eq "/merchants/#{merchant.id}"
    end
  end
end
