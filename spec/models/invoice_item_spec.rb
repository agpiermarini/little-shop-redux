describe 'Instance methods' do
  describe 'total' do
    it 'returns quantity times unit price' do
      invoice_item1 = InvoiceItem.create!(quantity: 2, unit_price: 5)
      invoice_item2 = InvoiceItem.create!(quantity: 3, unit_price: 10)

      expect(invoice_item1.total).to eq(10)
      expect(invoice_item2.total).to eq(30)
    end
  end
end
