require 'rails_helper'

RSpec.describe "shelters edit page", type: :feature do

  it "can edit shelter" do
    shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                address: "1489 Balake Ave.",
                                city: "Denver",
                                state: "CO",
                                zip: "80201",
                                )
    visit "/shelters/#{shelter_1.id}"
    click_on "Update Shelter"
    fill_in :name, with: "Best Friends"
    fill_in :address, with: "4500 3rd Ave."
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "84544"
    click_on "Submit"
    expect(page).to have_content("Best Friends")

  end

end
