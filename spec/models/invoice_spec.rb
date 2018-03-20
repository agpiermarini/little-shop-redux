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
      invoice = Invoice.create!(id: 1, merchant_id: 1, status: 'pending')
      invoice_item1 = InvoiceItem.create!(item_id: 1,
                                          invoice_id: 1,
                                          quantity: 1,
                                          unit_price: 1)
      invoice_item2 = InvoiceItem.create!(item_id: 1,
                                          invoice_id: 1,
                                          quantity: 5,
                                          unit_price: 5)

      expect(invoice.total).to eq(26.00)
    end
  end

  # thinking this should be moved to a module, as it will be useful elsewhere
  describe 'delimited_total' do
    it 'places commas as would be expected in dollar values' do
      invoice = Invoice.create!(merchant_id: 1, status: 'pending')
      number1 = invoice.delimited_total(12345)
      number2 = invoice.delimited_total(123456)
      number3 = invoice.delimited_total(1234)
      number4 = invoice.delimited_total(12)

      expect(number1).to eq("12,345")
      expect(number2).to eq("123,456")
      expect(number3).to eq("1,234")
      expect(number4).to eq("12")
    end
  end
end

describe 'Class method' do
  describe '.status_percentage' do
    it 'calculates percentage of invoices that have a given status' do
      Invoice.create!(merchant_id: 1, status: 'pending')
      Invoice.create!(merchant_id: 1, status: 'shipped')
      Invoice.create!(merchant_id: 1, status: 'pending')
      Invoice.create!(merchant_id: 1, status: 'shipped')
      Invoice.create!(merchant_id: 1, status: 'returned')
      Invoice.create!(merchant_id: 1, status: 'pending')
      pending = Invoice.status_percentage(status: 'pending')
      shipped = Invoice.status_percentage(status: 'shipped')
      returned = Invoice.status_percentage(status: 'returned')

      expect(shipped).to eq(33)
      expect(pending).to eq(50)
      expect(returned).to eq(17)
    end
  end

  describe '.highest_unit_price' do
    it 'returns invoice with highest associated unit price' do
      Invoice.create!(merchant_id: 1, status: 'pending')
      Invoice.create!(merchant_id: 1, status: 'shipped')
      Invoice.create!(merchant_id: 1, status: 'pending')
      InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 99)
      InvoiceItem.create!(item_id: 1, invoice_id: 2, quantity: 5, unit_price: 5)
      InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 5, unit_price: 102)
      InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 1)
      InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 5, unit_price: 1)


      expect(Invoice.highest_unit_price.id).to eq(3)
    end
  end

  describe '.lowest_unit_price' do
    it 'returns an array of ids of invoices with lowest associated unit price' do
      Invoice.create!(merchant_id: 1, status: 'pending')
      Invoice.create!(merchant_id: 1, status: 'shipped')
      Invoice.create!(merchant_id: 1, status: 'pending')
      InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 99)
      InvoiceItem.create!(item_id: 1, invoice_id: 2, quantity: 5, unit_price: 5)
      InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 5, unit_price: 102)
      InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 4)
      InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 5, unit_price: 63)



      expect(Invoice.lowest_unit_price.id).to eq(1)
    end
  end

  describe '.highest_quantity' do
    it 'returns invoice with highest associated quantity' do
      Invoice.create!(merchant_id: 1, status: 'pending')
      Invoice.create!(merchant_id: 1, status: 'shipped')
      Invoice.create!(merchant_id: 1, status: 'pending')
      InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 99)
      InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 1, unit_price: 4)
      InvoiceItem.create!(item_id: 1, invoice_id: 2, quantity: 20, unit_price: 4)
      InvoiceItem.create!(item_id: 1, invoice_id: 2, quantity: 5, unit_price: 5)
      InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 6, unit_price: 102)
      InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 8, unit_price: 63)



      expect(Invoice.highest_quantity.id).to eq(2)
    end
  end

  describe '.lowest_quantity' do
    it 'returns invoice with lowest associated quantity' do
      Invoice.create!(merchant_id: 1, status: 'pending')
      Invoice.create!(merchant_id: 1, status: 'shipped')
      Invoice.create!(merchant_id: 1, status: 'pending')
      InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 20, unit_price: 99)
      InvoiceItem.create!(item_id: 1, invoice_id: 1, quantity: 6, unit_price: 4)
      InvoiceItem.create!(item_id: 1, invoice_id: 2, quantity: 20, unit_price: 4)
      InvoiceItem.create!(item_id: 1, invoice_id: 2, quantity: 5, unit_price: 5)
      InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 20, unit_price: 102)
      InvoiceItem.create!(item_id: 1, invoice_id: 3, quantity: 8, unit_price: 63)

      expect(Invoice.lowest_quantity.id).to eq(2)
    end
  end
end
