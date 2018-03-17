describe 'Validation' do
  it 'should be invalid to not have a name' do
    merchant1 = Merchant.new
    merchant2 = Merchant.new(name: 'Turing')

    expect(merchant1).to_not be_valid
    expect(merchant2).to be_valid
  end
end
