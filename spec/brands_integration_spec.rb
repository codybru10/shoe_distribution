require 'spec_helper'

describe('view all brands', {:type => :feature}) do
  it('allows a user to see all shoe brands') do
    visit('/')
    click_button('View All Stores')
    expect(page).to have_content('All Brands')
  end
end

describe('adds a brand to all brand list', {:type => :feature}) do
  it('allows a user to add another brand') do
    visit('/brands')
    fill_in('brand_name', :with =>'Nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end
end

describe('view stores a shoe brand is sold at', {:type => :feature}) do
  it('allows a user to click link to view stores') do
    visit('/brands')
    fill_in('brand_name', :with =>'Nike')
    click_button('Add Brand')
    click_link('Nike')
    expect(page).to have_content('Nike')
  end
end

describe('view stores a shoe brand is sold at', {:type => :feature}) do
  it('allows a user to click link to view stores') do
    visit('/brands')
    fill_in('brand_name', :with =>'Nike')
    click_button('Add Brand')
    click_link('Nike')
    click_link('View All Stores')
    expect(page).to have_content('All Stores')
  end
end
