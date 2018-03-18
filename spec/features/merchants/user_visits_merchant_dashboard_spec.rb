describe 'user visits merchant dashboard' do
  context 'they see merchant with most items' do
    skip 'calculates merchant with most items' do
      merchant = Merchant.create(name: 'Crocs')
      merchant = Merchant.create(name: 'Nike')
      merchant = Merchant.create(name: 'Vans')
      item1 = Item.create!(title: 'Sandals',
                          description: 'Shoes with holes',
                          price: 50,
                          image: 'Picture of shoes with holes',
                          merchant_id: 1)
      item2 = Item.create!(title: 'FlyKnit',
                          description: 'Shoes with knit fabric',
                          price: 100,
                          image: 'Picture of shoes with knit fabric',
                          merchant_id: 2)
      item3 = Item.create!(title: 'Canvas shoes',
                          description: 'Low profile shoes made of canvas',
                          price: 150,
                          image: 'Picture of low profile shoes made of canvas',
                          merchant_id: 3)
      item = Item.create!(title: 'High tops',
                          description: 'Above ankle shoes made of canvas',
                          price: 200,
                          image: 'Picture of above ankle shoes made of canvas',
                          merchant_id: 3)

      visit '/merchants-dashboard'

      within(:css, "#most-items")
      expect(page).to have_content("Vans")
    end
  end

  context 'they see merchant with highest item price' do
    skip  'calculates merchant with highest item price' do
      merchant = Merchant.create(name: 'Crocs')
      merchant = Merchant.create(name: 'Nike')
      merchant = Merchant.create(name: 'Vans')
      item1 = Item.create!(title: 'Sandals',
                          description: 'Shoes with holes',
                          price: 50,
                          image: 'Picture of shoes with holes',
                          merchant_id: 1)
      item2 = Item.create!(title: 'FlyKnit',
                          description: 'Shoes with knit fabric',
                          price: 100,
                          image: 'Picture of shoes with knit fabric',
                          merchant_id: 2)
      item3 = Item.create!(title: 'Canvas shoes',
                          description: 'Low profile shoes made of canvas',
                          price: 150,
                          image: 'Picture of low profile shoes made of canvas',
                          merchant_id: 3)
      item = Item.create!(title: 'High tops',
                          description: 'Above ankle shoes made of canvas',
                          price: 200,
                          image: 'Picture of above ankle shoes made of canvas',
                          merchant_id: 3)

      visit '/merchants-dashboard'

      within(:css, "#highest-price")
      expect(page).to have_content("Vans")
    end
  end
end
