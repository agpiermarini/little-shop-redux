describe 'user visits invoices dashboard page' do
  it 'they see invoices dashboard header' do
    Invoice.create!(merchant_id: 1, status: 'pending')
    Invoice.create!(merchant_id: 1, status: 'shipped')
    Invoice.create!(merchant_id: 1, status: 'pending')
    InvoiceItem.create!(item_id: 1,
                        invoice_id: 1,
                        quantity: 1,
                        unit_price: 99)
    InvoiceItem.create!(item_id: 1,
                        invoice_id: 1,
                        quantity: 1,
                        unit_price: 1)
    InvoiceItem.create!(item_id: 1,
                        invoice_id: 2,
                        quantity: 5,
                        unit_price: 5)
    InvoiceItem.create!(item_id: 1,
                        invoice_id: 3,
                        quantity: 5,
                        unit_price: 500)
    InvoiceItem.create!(item_id: 1,
                        invoice_id: 3,
                        quantity: 5,
                        unit_price: 1)
    visit '/invoices-dashboard'

    expect(page).to have_content 'Invoices Dashboard'
  end

  it 'they see status percentages' do
    Invoice.create!(merchant_id: 1, status: 'pending')
    Invoice.create!(merchant_id: 1, status: 'shipped')
    Invoice.create!(merchant_id: 1, status: 'returned')
    InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 99)
    InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 1)
    InvoiceItem.create!(item_id: 1, invoice_id: 2, quantity: 5, unit_price: 5)
    InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 5, unit_price: 500)
    InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 5, unit_price: 1)
    visit '/invoices-dashboard'

    expect(page).to have_content 'Shipped: 33%'
    expect(page).to have_content 'Pending: 33%'
    expect(page).to have_content 'Returned: 33%'
  end

  it 'they see highest associated unit price' do
    Invoice.create!(id: 1111, merchant_id: 1, status: 'pending')
    Invoice.create!(id: 2222, merchant_id: 1, status: 'shipped')
    Invoice.create!(id: 3333, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 4444, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 5555, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 6666, merchant_id: 1, status: 'returned')
    InvoiceItem.create!(item_id: 1, invoice_id: 1111, quantity: 5, unit_price: 1000)
    InvoiceItem.create!(item_id: 1, invoice_id: 2222, quantity: 10, unit_price: 1)
    InvoiceItem.create!(item_id: 1, invoice_id: 3333, quantity: 100, unit_price: 5)
    InvoiceItem.create!(item_id: 1, invoice_id: 4444, quantity: 1, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 5555, quantity: 10, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 6666, quantity: 2, unit_price: 2)
    visit '/invoices-dashboard'

    expect(page).to have_content '1111'
    find_link('1111').visible?
  end

  it 'they see lowest associated unit price' do
    Invoice.create!(id: 1111, merchant_id: 1, status: 'pending')
    Invoice.create!(id: 2222, merchant_id: 1, status: 'shipped')
    Invoice.create!(id: 3333, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 4444, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 5555, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 6666, merchant_id: 1, status: 'returned')
    InvoiceItem.create!(item_id: 1, invoice_id: 1111, quantity: 5, unit_price: 1000)
    InvoiceItem.create!(item_id: 1, invoice_id: 2222, quantity: 10, unit_price: 1)
    InvoiceItem.create!(item_id: 1, invoice_id: 3333, quantity: 100, unit_price: 5)
    InvoiceItem.create!(item_id: 1, invoice_id: 4444, quantity: 1, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 5555, quantity: 10, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 6666, quantity: 2, unit_price: 2)
    visit '/invoices-dashboard'

    expect(page).to have_content '2222'
    find_link('2222').visible?
  end

  it 'they see invoice id with highest associated quantity' do
    Invoice.create!(id: 1111, merchant_id: 1, status: 'pending')
    Invoice.create!(id: 2222, merchant_id: 1, status: 'shipped')
    Invoice.create!(id: 3333, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 4444, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 5555, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 6666, merchant_id: 1, status: 'returned')
    InvoiceItem.create!(item_id: 1, invoice_id: 1111, quantity: 5, unit_price: 1000)
    InvoiceItem.create!(item_id: 1, invoice_id: 2222, quantity: 10, unit_price: 1)
    InvoiceItem.create!(item_id: 1, invoice_id: 3333, quantity: 100, unit_price: 5)
    InvoiceItem.create!(item_id: 1, invoice_id: 4444, quantity: 1, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 5555, quantity: 10, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 6666, quantity: 2, unit_price: 2)
    visit '/invoices-dashboard'

    expect(page).to have_content '3333'
    find_link('3333').visible?
  end

  it 'they see invoice id with lowest associated quantity' do
    Invoice.create!(id: 1111, merchant_id: 1, status: 'pending')
    Invoice.create!(id: 2222, merchant_id: 1, status: 'shipped')
    Invoice.create!(id: 3333, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 4444, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 5555, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 6666, merchant_id: 1, status: 'returned')
    InvoiceItem.create!(item_id: 1, invoice_id: 1111, quantity: 5, unit_price: 1000)
    InvoiceItem.create!(item_id: 1, invoice_id: 2222, quantity: 10, unit_price: 1)
    InvoiceItem.create!(item_id: 1, invoice_id: 3333, quantity: 100, unit_price: 5)
    InvoiceItem.create!(item_id: 1, invoice_id: 4444, quantity: 1, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 5555, quantity: 10, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 6666, quantity: 2, unit_price: 2)
    visit '/invoices-dashboard'

    expect(page).to have_content '4444'
    find_link('4444').visible?
  end

  it 'they see invoice id with highest total charges' do
    Invoice.create!(id: 1111, merchant_id: 1, status: 'pending')
    Invoice.create!(id: 2222, merchant_id: 1, status: 'shipped')
    Invoice.create!(id: 3333, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 4444, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 5555, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 6666, merchant_id: 1, status: 'returned')
    InvoiceItem.create!(item_id: 1, invoice_id: 1111, quantity: 5, unit_price: 1000)
    InvoiceItem.create!(item_id: 1, invoice_id: 2222, quantity: 10, unit_price: 1)
    InvoiceItem.create!(item_id: 1, invoice_id: 3333, quantity: 100, unit_price: 5)
    InvoiceItem.create!(item_id: 1, invoice_id: 4444, quantity: 1, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 5555, quantity: 10, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 6666, quantity: 2, unit_price: 2)
    visit '/invoices-dashboard'

    expect(page).to have_content '5555'
    find_link('5555').visible?
  end
  it 'they see invoice id with lowest total charges' do
    Invoice.create!(id: 1111, merchant_id: 1, status: 'pending')
    Invoice.create!(id: 2222, merchant_id: 1, status: 'shipped')
    Invoice.create!(id: 3333, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 4444, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 5555, merchant_id: 1, status: 'returned')
    Invoice.create!(id: 6666, merchant_id: 1, status: 'returned')
    InvoiceItem.create!(item_id: 1, invoice_id: 1111, quantity: 5, unit_price: 1000)
    InvoiceItem.create!(item_id: 1, invoice_id: 2222, quantity: 10, unit_price: 1)
    InvoiceItem.create!(item_id: 1, invoice_id: 3333, quantity: 100, unit_price: 5)
    InvoiceItem.create!(item_id: 1, invoice_id: 4444, quantity: 1, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 5555, quantity: 10, unit_price: 999)
    InvoiceItem.create!(item_id: 1, invoice_id: 6666, quantity: 2, unit_price: 2)
    visit '/invoices-dashboard'

    expect(page).to have_content '6666'
    find_link('6666').visible?
  end
end
