describe 'user visits edit invoice page' do
  skip 'they see header with invoice number and status' do
    invoice = Invoice.create(merchant_id: 123, status: 'pending')
    merchant1 = Merchant.create(id: 123, Name: 'Boaty McBoatface')
    visit "/invoices/#{invoice.id}/edit"

    expect(page).to have_content "Invoice: #{invoice.id} - #{invoice.status}"
    expect(page).to have_select('merchant-select', selected: merchant1.name)
    expect(page).to have_select('status-select', selected: invoice.status)
  end
end
