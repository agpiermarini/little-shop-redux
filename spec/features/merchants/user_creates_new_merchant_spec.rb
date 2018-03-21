describe 'user visits create new merchant page' do
  context 'they complete and submit new merchant form' do
    it 'they create new merchant' do
      visit '/merchants/new'
      fill_in 'Name', :with => 'Toms'
      click_button 'Create Merchant'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content 'Toms'
    end
  end

  context 'they do not fill in a name' do
    skip 'they recieve a flash error' do
      Merchant.create(name: 'Ussss')
      visit '/merchants/new'
      click_button 'Create Merchant'

      expect(current_path).to eq('flash error!!!!??')
    end
  end

  context 'they try to submit a blank space as a name' do
    skip 'they recieve a flash error' do
      Merchant.create(name: 'Ussss')
      visit "/merchants/new"
      fill_in 'Name', :with => ' '
      click_button 'Create Merchant'

      expect(current_path).to eq('flash error!!!!??')
    end
  end

  context 'they cancel new merchant creation' do
    it 'they return to merchants' do
      visit '/merchants/new'
      click_link 'Cancel'

      expect(current_path).to eq('/merchants')
    end
  end
end
