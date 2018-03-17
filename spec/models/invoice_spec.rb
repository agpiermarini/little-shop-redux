describe 'Validation' do
  it 'should be invalid to not have a merchant id and status' do
    invoice1 = Invoice.create
    invoice2 = Invoice.create(merchant_id: 1)
    invoice3 = Invoice.create(status: 'pending')
    invoice4 = Invoice.create(merchant_id: 1, status: 'pending')


    expect(invoice1).to_not be_valid
    expect(invoice2).to_not be_valid
    expect(invoice3).to_not be_valid
    expect(invoice4).to be_valid
  end
end

describe 'Instance method' do
  describe 'total' do
    it 'calculates total amount charged invoice' do
      invoice = Invoice.create!(merchant_id: 1, status: 'pending')
      invoice_item1 = InvoiceItem.create!(invoice_id: 1, quantity: 1, unit_price: 1)
      invoice_item2 = InvoiceItem.create!(invoice_id: 1, quantity: 5, unit_price: 5)

      expect(invoice.total).to eq(26.00)
    end
  end
end
