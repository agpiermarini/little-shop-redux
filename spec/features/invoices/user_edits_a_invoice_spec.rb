describe 'user edits invoice merchant and status' do
  describe 'and they are redirected to invoice page' do
    it 'and invoice merchant and status reflect new information' do
      invoice = Invoice.create(merchant_id: 123, status: 'pending')
      merchant1 = Merchant.create(id: 123, name: 'Boaty McBoatface')
      merchant2 = Merchant.create(id: 234, name: 'Test')
      visit "/invoices/#{invoice.id}/edit"

      select 'Test', :from => "merchant"
      select 'Returned', :from => "status"

      click_button 'Update Invoice'
      expect(current_path).to eq("/invoices/#{invoice.id}")
      expect(page).to have_content('Test')
    end
  end
end
