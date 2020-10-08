require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
    shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                address: "1489 Balake Ave.",
                                city: "Denver",
                                state: "CO",
                                zip: "80201",
                                )
    shelter_2 = Shelter.create( name: "Furry Friends",
                                address: "308 Ranch blvd",
                                city: "Denver",
                                state: "CO",
                                zip: "80203",
                                )

    visit "/shelters"
    
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
