require 'spec_helper'

describe('view all stores') do
  it('show a list of all store', {:type => :feature}) do
    visit('/')
    click_button('View All Stores')
    expect(page).to have_content('All Stores')
  end
end

describe('add a new store to list') do
  it('the user will enter a new store into the form', {:type => :feature}) do
    visit('/stores')
    fill_in('store_name', :with => 'Champs')
    click_button('Add Store')
    expect(page).to have_content('Champs')
  end
end

describe('how to view brands for that specific brand') do
  it('the user will click the store link to view all brands under that store', {:type => :feature}) do
    visit('/stores')
    fill_in('store_name', :with => 'Champs')
    click_button('Add Store')
    click_link('Champs')
    expect(page).to have_content('Champs')
  end
end

describe('how to view brands for that specific brand') do
  it('the user will click the store link to view all brands under that store', {:type => :feature}) do
    visit('/stores')
    fill_in('store_name', :with => 'Champs')
    click_button('Add Store')
    click_link('Champs')
    click_link('Back to Brands List')
    expect(page).to have_content('All Brands')
  end
end

describe('how to update store name') do
  it('allows user to fill in form to edit store name', {:type => :feature}) do
    visit('/stores')
    fill_in('store_name', :with => 'Champs')
    click_button('Add Store')
    click_link('Champs')
    fill_in('edit_name', :with => 'Champs shop')
    click_button('Update Store Name')
    expect(page).to have_content('Champs shop')
  end
end

describe('how to update store name') do
  it('allows user to fill in form to edit store name', {:type => :feature}) do
    visit('/stores')
    fill_in('store_name', :with => 'Champs')
    click_button('Add Store')
    click_link('Champs')
    click_button('Delete Store')
    expect(page).to have_content('All Stores')
  end
end
