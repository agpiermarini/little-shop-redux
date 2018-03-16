describe 'user visits invoices list page' do
  context 'they visit /invoices' do
    it 'they see a invoices header' do
      visit '/invoices'

      expect(page).to have_content 'Invoices'
    end
  end

  context 'they click on individual invoice link' do
    it 'they are redirected to individual invoice path' do
      Invoice.create(merchant_id: 10000, status: "shipping")
      visit '/invoices'
      click_link '10000'

      current_path.should == '/invoices/1'
    end
  end

  context 'they click on edit invoice button' do
    it 'they are redirected to /invoice/:id/edit' do
      Invoice.create(merchant_id: 1, status: "shipping")
      visit '/invoices'
      click_button 'Edit'

      current_path.should == '/invoices/1/edit'
    end
  end

  context 'they click on delete invoice button' do
    it 'they delete a invoice' do
      Invoice.create(merchant_id: 1, status: "shipping")
      visit '/invoices'
      expect(page).to have_content '1'

      click_button 'Delete'
      expect(current_path).to eq('/invoices')
      expect(page).to_not have_content '1'
    end
  end
end
