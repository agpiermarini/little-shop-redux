describe 'user visits individual invoice page' do
  it 'they see merchant_id' do
    Invoice.create(merchant_id: 10000, status: 'pending')
    visit 'invoices/7'
    expect(page).to have_content 10000
  end
end
