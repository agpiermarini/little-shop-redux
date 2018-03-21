describe 'user visits items dashboard page' do
  context 'they visit /items-dashboard' do
    it 'they see item dashboard header' do
      Item.create(title: 'Thing',
                  description: 'Thing #1',
                  price: 500,
                  image: 'Picture of Thing #1',
                  merchant_id: 1)
      Item.create(title: 'Ring',
                  description: 'Sparkly',
                  price: 1000,
                  image: 'Picture of ring',
                  merchant_id: 2)
      Item.create(title: 'Necklace',
                  description: 'Long',
                  price: 1500,
                  image: 'Picture of necklace',
                  merchant_id: 3)
      visit '/items-dashboard'

      expect(page).to have_content 'Items Dashboard'
    end
  end

  context 'they visit /items-dashboard' do
    it 'they see total item count' do
      Item.create(title: 'Thing',
                  description: 'Thing #1',
                  price: 500,
                  image: 'Picture of Thing #1',
                  merchant_id: 1)
      Item.create(title: 'Ring',
                  description: 'Sparkly',
                  price: 1000,
                  image: 'Picture of ring',
                  merchant_id: 2)
      Item.create(title: 'Necklace',
                  description: 'Long',
                  price: 1500,
                  image: 'Picture of necklace',
                  merchant_id: 3)
      visit '/items-dashboard'

      expect(page).to have_content 'Total Item Count'
      expect(page).to have_content 3
    end
  end

  context 'they visit /items-dashboard' do
    it 'they see average price per item' do
      Item.create(title: 'Thing',
                  description: 'Thing #1',
                  price: 500,
                  image: 'Picture of Thing #1',
                  merchant_id: 1)
      Item.create(title: 'Ring',
                  description: 'Sparkly',
                  price: 1000,
                  image: 'Picture of ring',
                  merchant_id: 2)
      Item.create(title: 'Necklace',
                  description: 'Long',
                  price: 1500,
                  image: 'Picture of necklace',
                  merchant_id: 3)
      visit '/items-dashboard'

      expect(page).to have_content 'Avg Price Per Item'
      expect(page).to have_content 1000
    end
  end

  context 'they visit /items-dashboard' do
    it 'they see the titles of the newest and oldest items' do
      Item.create(title: 'Thing',
                  description: 'Thing #1',
                  price: 500,
                  image: 'Picture of Thing #1',
                  merchant_id: 1)
      Item.create(title: 'Ring',
                  description: 'Sparkly',
                  price: 1000,
                  image: 'Picture of ring',
                  merchant_id: 2)
      Item.create(title: 'Necklace',
                  description: 'Long',
                  price: 1500,
                  image: 'Picture of necklace',
                  merchant_id: 3)
      visit '/items-dashboard'

      expect(page).to have_content 'Item by Age'
      expect(page).to have_content 'Newest'
      expect(page).to have_content 'Necklace'
      expect(page).to have_content 'Oldest'
      expect(page).to have_content 'Thing'
    end
  end
end
