describe 'user visits edit item page' do
  context 'they complete and submit edit item form' do
    it 'they edit item' do
      item = Item.create!(title: 'Things',
                          description: 'Thing #1',
                          price: 5,
                          image: 'Picture of Thing #1',
                          merchant_id: 1)
      Merchant.create!(name: 'Youuuuuu')
      Merchant.create!(name: 'Him')
      Merchant.create!(name: 'Her')
      visit "/items/#{item.id}/edit"
      select 'Him', :from => 'Merchant'
      fill_in 'Title', :with => 'Things'
      fill_in 'Description', :with => 'Thing #1'
      fill_in 'Price', :with => 500
      fill_in 'Image URL', :with => 'Picture of Thing #1'
      click_button 'Update Item'

      expect(current_path).to eq("/items/#{item.id}")
      visit "/items/#{item.id}"
      expect(page).to have_content 'Him'
    end
  end
end
