describe 'user visits individual invoice page' do
  it 'they see merchant_id' do
    invoice = Invoice.create(merchant_id: 100, status: 'pending')
    visit 'invoices/<%= invoice.id %>'
    expect(page).to have_content "Invoice: <%= invoice.id %> - <%= invoice.status %>"
  end
end
