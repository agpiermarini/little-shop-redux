describe 'Validation' do
  it 'should be invalid to not have a name' do
    merchant1 = Merchant.new
    merchant2 = Merchant.new(name: 'Turing')

    expect(merchant1).to_not be_valid
    expect(merchant2).to be_valid
  end
end

describe 'Instance Methods' do
  describe '#item_count' do
    it "counts merchants' items" do
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

      expect(merchant.item_count).to eq(4)
    end
  end

  describe '#average_item_price' do
    it "averages the cost of merchants' items" do
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

      expect(merchant.average_item_price).to eq(125)
    end
  end

  describe '#total_item_cost' do
    it "totals the cost of merchants' items" do
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

      expect(merchant.total_item_cost).to eq(500)
    end
  end
end
