describe 'user visits invoices list page' do
  context 'they visit /invoices' do
    it 'they see a invoices header' do
      visit '/invoices'

      expect(page).to have_content 'Invoices'
    end
  end

  context 'they click on individual invoice link' do
    it 'they are redirected to individual invoice path' do
      invoice = Invoice.create(merchant_id: 100, status: 'shipping')
      Merchant.create(id: 100, name: "Y")
      visit '/invoices'
      click_link "#{invoice[:id]}"

      expect(current_path).to eq "/invoices/#{invoice[:id]}"
    end
  end

  context 'they click on edit invoice button' do
    it 'they are redirected to /invoice/:id/edit' do
      invoice = Invoice.create(merchant_id: 1, status: 'shipping')
      Merchant.create(id: 1, name: 'Boaty McBoatface')
      visit '/invoices'
      click_link 'Edit'

      expect(current_path).to eq "/invoices/#{invoice[:id]}/edit"
    end
  end

  context 'they click on delete invoice button' do
    it 'they delete an invoice' do
      invoice = Invoice.create(merchant_id: 1, status: 'shipping')
      visit '/invoices'
      expect(page).to have_content "#{invoice[:id]}"

      click_button 'Delete'
      expect(current_path).to eq '/invoices'
      expect(page).to_not have_content "#{invoice[:id]}"
    end
  end
end
