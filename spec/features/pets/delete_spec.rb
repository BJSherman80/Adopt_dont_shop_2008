require 'rails_helper'

RSpec.describe "pet can be deleted", type: :feature do

  it "can delete a pet" do
    shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                address: "1489 Balake Ave.",
                                city: "Denver",
                                state: "CO",
                                zip: "80201",
                                )
    vernon = shelter_1.pets.create!(name: "Vernon", age: 18, sex: "male", image: "vernon.png" )

    visit "/pets/#{vernon.id}"
    click_on "Delete"
    expect(page).to_not have_content("Vernon")
  end

end
