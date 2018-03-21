describe 'user visits individual invoice page' do
  it 'they see invoice_id and invoice status' do
    invoice = Invoice.create(merchant_id: 100, status: 'pending')
    Merchant.create(id: 100, name: 'Boaty McBoatface')
    visit "/invoices/#{invoice.id}"
    expect(page).to have_content "Invoice: #{invoice.id} - #{invoice.status.capitalize}"
  end

  it 'they see merchant name' do
    invoice = Invoice.create(merchant_id: 100, status: 'pending')
    merchant = Merchant.create(id: 100, name: 'Boaty McBoatface')
    visit "/invoices/#{invoice.id}"
    expect(page).to have_content "#{merchant.name}"
  end
end

describe 'user sees items on invoice' do
  it 'they see invoice item attributes' do
    invoice = Invoice.create(merchant_id: 100,
                             status: 'pending')
    merchant = Merchant.create(id: 100,
                               name: 'Boaty McBoatface')
    invoice_item1 = InvoiceItem.create(id: 1,
                                       item_id: 1,
                                       invoice_id: 1,
                                       quantity: 1,
                                       unit_price: 20)
    item = Item.create!(title: 'Things',
                        description: 'Thing #1',
                        price: 5,
                        image: 'Picture of Thing #1',
                        merchant_id: 1)

    visit "/invoices/#{invoice.id}"
    expect(page).to have_content "#{merchant.name}"
  end
end
