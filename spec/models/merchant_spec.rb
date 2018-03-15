RSpec.describe Merchant do
  describe 'Validation' do
    it 'should be invalid to not have a name' do
      merchant_1 = Merchant.new
      merchant_2 = Merchant.new(name: 'Turing')

      expect(merchant_1).to_not be_valid
      expect(merchant_2).to be_valid
    end
  end
end
