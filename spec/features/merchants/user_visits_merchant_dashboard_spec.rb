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
      item4 = Item.create!(title: 'High tops',
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
      item4 = Item.create!(title: 'High tops',
                          description: 'Above ankle shoes made of canvas',
                          price: 200,
                          image: 'Picture of above ankle shoes made of canvas',
                          merchant_id: 3)

      visit '/merchants-dashboard'

      within(:css, "#highest-price")
      expect(page).to have_content("Vans")
    end
  end

  context "they see an individual merchant's analytics" do
    skip "shows an individual merchant's item count" do
      merchant = Merchant.create(name: 'Crocs')
      item1 = Item.create!(title: 'Sandals',
                          description: 'Shoes with holes',
                          price: 50,
                          image: 'Picture of shoes with holes',
                          merchant_id: 1)
      item2 = Item.create!(title: 'Heels',
                          description: 'Plastic shoes with holes',
                          price: 100,
                          image: 'Picture of shoes with knit fabric',
                          merchant_id: 1)
      item3 = Item.create!(title: 'Sneakers',
                          description: 'Very ugly shoes',
                          price: 150,
                          image: 'Picture of very ugly shoes',
                          merchant_id: 1)
      item4 = Item.create!(title: 'Flip Flops',
                          description: 'Why do these exist',
                          price: 200,
                          image: 'Picture of tremendously ugly shoes',
                          merchant_id: 1)

      within(:css, "#merchant-id-#{merchant.id}")
      expect(page).to have_content("Item Count: 4")
    end

    skip "shows an individual merchant's average item price" do
    end

    skip "shows individual merchant's total cost of items" do
    end
  end
end
