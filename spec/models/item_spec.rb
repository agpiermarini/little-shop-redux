describe 'Validation' do
  it 'should be invalid if it does not have a title' do
    item1 = Item.new
    item2 = Item.new(description: 'Thing #1',
                     price: 5,
                     image: 'Picture of Thing #1')

    expect(item1).to_not be_valid
    expect(item2).to_not be_valid
  end

  it 'should be invalid if it does not have a description' do
    item = Item.new(title: 'Things',
                    price: 5,
                    image: 'Picture of Thing #1')

    expect(item).to_not be_valid
  end

  it 'should be invalid if it does not have a price' do
    item = Item.new(title: 'Things',
                    description: 'Thing #1',
                    image: 'Picture of Thing #1')

    expect(item).to_not be_valid
  end

  it 'should be invalid if it does not have an image' do
    item = Item.new(title: 'Things',
                    description: 'Thing #1',
                    price: 5)

    expect(item).to_not be_valid
  end

  it 'should be valid if it has all attributes' do
    item = Item.new(merchant_id: 1,
                    title: 'Things',
                    description: 'Thing #1',
                    price: 5,
                    image: 'Picture of Thing #1')

    expect(item).to be_valid
  end
end

describe 'Class Methods' do
  describe '.count' do
    it 'returns total number of items' do
      Item.create!(title: 'Thing',
                   description: 'Thing #1',
                   price: 500,
                   image: 'Picture of Thing #1',
                   merchant_id: 1)
      Item.create!(title: 'Ring',
                   description: 'Sparkly',
                   price: 1000,
                   image: 'Picture of ring',
                   merchant_id: 2)
      Item.create!(title: 'Necklace',
                   description: 'Long',
                   price: 1500,
                   image: 'Picture of necklace',
                   merchant_id: 3)

      expect(Item.count).to eq(3)
    end
  end

  describe '.average(price)' do
    it 'returns average price per item' do
      Item.create!(title: 'Thing',
                   description: 'Thing #1',
                   price: 500,
                   image: 'Picture of Thing #1',
                   merchant_id: 1)
      Item.create!(title: 'Ring',
                   description: 'Sparkly',
                   price: 1000,
                   image: 'Picture of ring',
                   merchant_id: 2)
      Item.create!(title: 'Necklace',
                   description: 'Long',
                   price: 1500,
                   image: 'Picture of necklace',
                   merchant_id: 3)

      expect(Item.average(:price)).to eq(1000)
    end
  end

  describe '.average(price)' do
    it 'returns average price per item' do
      Item.create!(title: 'Thing',
                   description: 'Thing #1',
                   price: 500,
                   image: 'Picture of Thing #1',
                   merchant_id: 1)
      Item.create!(title: 'Ring',
                   description: 'Sparkly',
                   price: 1000,
                   image: 'Picture of ring',
                   merchant_id: 2)
      Item.create!(title: 'Necklace',
                   description: 'Long',
                   price: 1500,
                   image: 'Picture of necklace',
                   merchant_id: 3)

      expect(Item.average(:price)).to eq(1000)
    end
  end

  describe '.newest_item' do
    it 'returns the title of the most recently created item' do
      Item.create!(title: 'Thing',
                   description: 'Thing #1',
                   price: 500,
                   image: 'Picture of Thing #1',
                   merchant_id: 1)
      Item.create!(title: 'Ring',
                   description: 'Sparkly',
                   price: 1000,
                   image: 'Picture of ring',
                   merchant_id: 2)
      Item.create!(title: 'Necklace',
                   description: 'Long',
                   price: 1500,
                   image: 'Picture of necklace',
                   merchant_id: 3)

      expect(Item.newest_item).to eq('Necklace')
    end
  end

  describe '.oldest_item' do
    it 'returns the title of the oldest item' do
      Item.create!(title: 'Thing',
                   description: 'Thing #1',
                   price: 500,
                   image: 'Picture of Thing #1',
                   merchant_id: 1)
      Item.create!(title: 'Ring',
                   description: 'Sparkly',
                   price: 1000,
                   image: 'Picture of ring',
                   merchant_id: 2)
      Item.create!(title: 'Necklace',
                   description: 'Long',
                   price: 1500,
                   image: 'Picture of necklace',
                   merchant_id: 3)

      expect(Item.oldest_item).to eq('Thing')
    end
  end
end
