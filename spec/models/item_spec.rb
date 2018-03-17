describe 'Validation' do
  it 'should be invalid if it does not have a title' do
    item1 = Item.new
    item2 = Item.new(description: 'Thing #1', price: 5, image: 'Picture of Thing #1')

    expect(item1).to_not be_valid
    expect(item2).to_not be_valid
  end

  it 'should be invalid if it does not have a description' do
    item = Item.new(title: 'Things', price: 5, image: 'Picture of Thing #1')

    expect(item).to_not be_valid
  end

  it 'should be invalid if it does not have a price' do
    item = Item.new(title: 'Things', description: 'Thing #1', image: 'Picture of Thing #1')

    expect(item).to_not be_valid
  end

  it 'should be invalid if it does not have an image' do
    item = Item.new(title: 'Things', description: 'Thing #1', price: 5)

    expect(item).to_not be_valid
  end

  it 'should be valid if it has all attributes' do
    item = Item.new(title: 'Things', description: 'Thing #1', price: 5, image: 'Picture of Thing #1')

    expect(item).to be_valid
  end
end
