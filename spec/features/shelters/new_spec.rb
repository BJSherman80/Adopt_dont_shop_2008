require 'rails_helper'

RSpec.describe "new shelter", type: :feature do

  it "can navigate to New Shelter page" do

    visit "/shelters"
    click_on "New Shelter"
    expect(page).to have_content("Enter a new shelter:")
    expect(page).to have_button("Create Shelter")

  end

  it "can fill out new shelter form" do

    visit "/shelters/new"

    fill_in "shelter[name]", with: "Burts Farm Animals"
    fill_in "shelter[address]", with: "87453 Dirt Road #4 "
    fill_in "shelter[city]", with: "Longmont"
    fill_in "shelter[state]", with: "CO"
    fill_in "shelter[zip]", with: "897655"
    click_button "Create Shelter"
    expect(page).to have_content("Burts Farm Animals")

  end
end
