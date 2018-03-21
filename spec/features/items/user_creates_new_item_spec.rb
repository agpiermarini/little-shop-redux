describe 'user visits create new item page' do
  context 'they complete and submit new item form' do
    it 'they create new item' do
      Merchant.create!(name: 'Youuuuuu')
      Merchant.create!(name: 'Him')
      Merchant.create!(name: 'Her')
      visit '/items/new'
      select 'Him', :from => 'Merchant'
      fill_in 'Title', :with => 'Things'
      fill_in 'Description', :with => 'Thing #1'
      fill_in 'Price', :with => 500
      fill_in 'Image URL', :with => 'Picture of Thing #1'

      click_button 'Create Item'

      expect(current_path).to eq('/items')
      expect(page).to have_content 'Things'
    end
  end

  context 'they do not fill in a form field' do
    skip 'they recieve a flash error' do
      Merchant.create(name: 'Ussss')
      visit '/items/new'
      click_button 'Create Item'

      expect(current_path).to eq('flash error!!!!??')
    end
  end

  context 'they try to submit a blank space as a form field' do
    skip 'they recieve a flash error' do
      Merchant.create(name: 'Ussss')
      visit "/items/new"
      fill_in 'Title', :with => ' '
      click_button 'Create New Item'

      expect(current_path).to eq('flash error!!!!??')
    end
  end

  context 'they cancel new item creation' do
    it 'they return to items' do
      visit '/items/new'
      click_link 'Cancel'

      expect(current_path).to eq('/items')
    end
  end
end
