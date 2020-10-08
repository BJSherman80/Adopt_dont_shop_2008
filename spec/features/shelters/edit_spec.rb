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
    fill_in "shelter[name]", with: "Best Friends"
    fill_in "shelter[address]", with: "4500 3rd Ave."
    fill_in "shelter[city]", with: "Denver"
    fill_in "shelter[state]", with: "CO"
    fill_in "shelter[zip]", with: "84544"
    click_on "Submit"
    expect(page).to have_content("Best Friends")

  end

end
