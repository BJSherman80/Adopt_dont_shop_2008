require 'rails_helper'

RSpec.describe "new user", type: :feature do

  it "can create a new user" do

    visit "/users/new"

    fill_in :name, with: "Brett"
    fill_in :address, with: "198 main ave"
    fill_in :city, with: "Longmont"
    fill_in :state, with: "CO"
    fill_in :zip, with: "897655"


    click_button "Create User"
    save_and_open_page
    #question: should we have an expect current path test here?
    expect(page).to have_content("Brett")
    expect(page).to have_content("198 main ave")
    expect(page).to have_content("Longmont")
    expect(page).to have_content("CO")
    expect(page).to have_content("897655")

  end
end
