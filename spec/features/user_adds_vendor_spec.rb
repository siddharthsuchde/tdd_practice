require 'spec_helper'

feature 'Adds Vendor' do
  scenario 'users can add or edit vendor on list' do
    pioneer = Fabricate(:vendor)
    visit root_path
    click_link 'New Vendor'
    expect(page).to have_content 'Enter New Vendor'
    
    fill_in 'Name', :with => 'Pioneer'
    fill_in 'Address', :with => pioneer.address
    fill_in 'Phone', :with => pioneer.phone
    fill_in 'Email', :with => pioneer.email
    click_button 'Create Vendor'
    expect(page).to have_content pioneer.name
    
    click_link pioneer.name
    fill_in 'Name', :with => 'Caxton'
    click_button 'Update Vendor'
    expect(page).to have_content('Caxton')
    
  end
end
