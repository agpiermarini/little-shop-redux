describe 'Validation' do
  it 'should be invalid to not have a merchant id and status' do
    invoice_1 = Invoice.new
    invoice_2 = Invoice.new(id: 1)
    invoice_3 = Invoice.new(status: "pending")
    invoice_4 = Invoice.new(id: 1, status: "pending")


    expect(invoice_1).to_not be_valid
    expect(invoice_2).to_not be_valid
    expect(invoice_3).to_not be_valid
    expect(invoice_4).to be_valid
  end
end
