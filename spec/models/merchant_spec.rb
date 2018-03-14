RSpec.describe Merchant do
  describe 'Validation' do
    it 'should be invalid to not have a name' do
      merchant_1 = Merchant.new()
      merchant_2 = Merchant.new(name: 'Turing')

      expect(merchant_1).to_not be_valid
      expect(merchant_2).to be_valid
    end
  end

  describe 'Create merchant' do
    it 'should add merchant to database' do
      Merchant.create!(name: 'One')
      Merchant.create!(name: 'Turing')

      expect(Merchant.find(1)).to be_an_instance_of(Merchant)
    end
  end

  describe 'Read merchant' do
    it 'can retrieve all merchants' do
      Merchant.create!(name: 'One')
      Merchant.create!(name: 'Turing')

      expect(Merchant.all.size).to eq(2)
    end

    it 'can retrieve merchant by id' do
      Merchant.create!(name: 'One')
      Merchant.create!(name: 'Turing')

      expect(Merchant.find(1).name).to eq('One')
      expect(Merchant.find(2).name).to eq('Turing')
    end
  end

  describe 'Update merchant' do
    it 'can change merchant name' do
      Merchant.create!(name: 'One')

      expect(Merchant.find(1).name).to eq('One')

      Merchant.find(1).update(name: 'Two')

      expect(Merchant.find(1).name).to eq('Two')
    end
  end

  describe 'Delete merchant' do
    it 'should delete merchant' do
      Merchant.create!(name: 'One')
      Merchant.create!(name: 'Turing')

      expect(Merchant.all.size).to eq(2)

      Merchant.delete(1)

      expect(Merchant.all.size).to eq(1)
    end
  end

end
