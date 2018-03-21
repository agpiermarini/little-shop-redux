describe 'user visits items list page' do
  context 'they visit /items' do
    it 'they see a items header' do
      visit '/items'

      expect(page).to have_content 'Items'
    end
  end

  context 'they click on individual item link' do
    it 'they are redirected to individual item path' do
      item = Item.create!(title: 'Things',
                          description: 'Thing #1',
                          price: 5,
                          image: 'Picture of Thing #1',
                          merchant_id: 1)
      Merchant.create(name: 'Youuuuuu')
      visit '/items'
      click_link item[:title].to_s

      expect(current_path).to eq "/items/#{item[:id]}"
    end
  end

  context 'they click on create new item link' do
    it 'they are redirected to /items/new' do
      Item.create!(title: 'Things',
                   description: 'Thing #1',
                   price: 5,
                   image: 'Picture of Thing #1',
                   merchant_id: 1)
      Merchant.create(name: 'Youuuuuu')
      visit '/items'
      click_link 'Create a New Item'

      expect(current_path).to eq '/items/new'
    end
  end
end
