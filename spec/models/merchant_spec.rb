RSpec.describe Merchant do
  describe 'Validation' do
    it 'is invalid to not have a name' do
      merchant = Merchant.new()

      expect(merchant).to_not be_valid
    end
  end

  describe 'Add to Merchant database' do
    before(:all) do
      Merchant.create!(name: "One")
      Merchant.create!(name: "Turing")
    end

    it 'can create merchant' do
      expect(Merchant.find(1)).to be_an_instance_of(Merchant)
    end

    it 'merchant has a name' do
      expect(Merchant.find(1).name).to eq("One")
      expect(Merchant.find(2).name).to eq("Turing")
    end
  end
end
