describe 'user visits edit merchant page' do
  context 'they complete and submit edit merchant form' do
    it 'they edit merchant' do
      merchant = Merchant.create(name: 'Ussss')
      visit "/merchants/#{merchant.id}/edit"
      fill_in 'Name', :with => 'Youuu'
      click_button 'Update Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content 'Youuu'
    end
  end

  context 'they do not fill in a name' do
    skip 'they recieve a flash error' do
      merchant = Merchant.create(name: 'Ussss')
      visit "/merchants/#{merchant.id}/edit"
      click_button 'Update Merchant'

      expect(current_path).to eq('flash error!!!!??')
    end
  end

  context 'they try to submit a blank space as a name' do
    skip 'they recieve a flash error' do
      merchant = Merchant.create(name: 'Ussss')
      visit "/merchants/#{merchant.id}/edit"
      fill_in 'Name', :with => ' '
      click_button 'Update Merchant'

      expect(current_path).to eq('flash error!!!!??')
    end
  end
end
