RSpec.describe Merchant do
  describe 'Validation' do
    it 'is invalid to not have a name' do
      merchant = Merchant.new()

      expect(merchant).to_not be_valid
    end
  end

  describe 'Add to Merchant database' do
    it 'can create merchant' do
      Merchant.create!(name: "One")
      Merchant.create!(name: "Turing")

      expect(Merchant.find(1)).to be_an_instance_of(Merchant)
    end

    it 'merchant has a name' do
      Merchant.create!(name: "One")
      Merchant.create!(name: "Turing")

      expect(Merchant.find(1).name).to eq("One")
      expect(Merchant.find(2).name).to eq("Turing")
    end
  end

  describe 'Class Methods' do
    describe '.all' do
      it 'retrieves all merchants' do
        Merchant.create!(name: "One")
        Merchant.create!(name: "Turing")

        expect(Merchant.all.size).to eq(2)
      end
    end
  end
end
