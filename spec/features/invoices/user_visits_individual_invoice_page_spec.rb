describe 'user visits individual invoice page' do
  it 'they see invoice_id and invoice status' do
    invoice = Invoice.create(merchant_id: 100, status: 'pending')
    merchant = Merchant.create(id: 100, name: 'Boaty McBoatface')
    visit "/invoices/#{invoice.id}"
    expect(page).to have_content "Invoice: #{invoice.id} - #{invoice.status}"
  end
end

describe 'test' do
  it 'they see merchant name' do
    invoice = Invoice.create(merchant_id: 100, status: 'pending')
    merchant = Merchant.create(id: 100, name: 'Boaty McBoatface')
    visit "/invoices/#{invoice.id}"
    expect(page).to have_content "#{merchant.name}"
  end
end
