describe 'user visits edit item page' do
  context 'they complete and submit edit item form' do
    it 'they edit item' do
      item = Item.create(title: 'Things',
                         description: 'Thing #1',
                         price: 5,
                         image: 'Picture of Thing #1',
                         merchant_id: 1)
      Merchant.create(name: 'Youuuuuu')
      Merchant.create(name: 'Him')
      Merchant.create(name: 'Her')
      visit "/items/#{item.id}/edit"
      select 'Him', :from => 'Merchant'
      fill_in 'Description', :with => 'Here'
      fill_in 'Price', :with => '500'
      click_button 'Update Item'

      expect(current_path).to eq('/items')
      visit "/items/#{item.id}"
      expect(page).to have_content "Youuuuuu"
      expect(page).to have_content "500"
    end
  end

  skip 'they see header with invoice number and status' do
    invoice = Invoice.create(merchant_id: 123, status: 'pending')
    merchant1 = Merchant.create(id: 123, Name: 'Boaty McBoatface')
    visit "/invoices/#{invoice.id}/edit"

    expect(page).to have_content "Invoice: #{invoice.id} - #{invoice.status}"
    expect(page).to have_select('merchant-select', selected: merchant1.name)
    expect(page).to have_select('status-select', selected: invoice.status)
  end
end
