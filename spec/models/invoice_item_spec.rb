describe 'Validation' do
  it 'should be invalid to not have a merchant id and status' do
    invoice1 = InvoiceItem.create(item_id: 1)
    invoice2 = InvoiceItem.create(item_id: 1,
                                   invoice_id: 1)
    invoice3 = InvoiceItem.create(item_id: 1,
                                   invoice_id: 1,
                                   quantity: 1)
    invoice4 = InvoiceItem.create(item_id: 1,
                                   invoice_id: 1,
                                   quantity: 1,
                                   unit_price: 99)


    expect(invoice1).to_not be_valid
    expect(invoice2).to_not be_valid
    expect(invoice3).to_not be_valid
    expect(invoice4).to be_valid
  end
end
