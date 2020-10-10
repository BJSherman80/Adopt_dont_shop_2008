require 'rails_helper'

RSpec.describe "shelter_pets index page", type: :feature do
  it "can see all pets attributes associated with specific shelter" do
    shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                address: "1489 Balake Ave.",
                                city: "Denver",
                                state: "CO",
                                zip: "80201",
                                )

    vernon = shelter_1.pets.create!(name: "Vernon", age: 18, sex: "male", image: "vernon.png" )

    visit "/shelters/#{shelter_1.id}/pets"
    save_and_open_page
    expect(page).to have_content(vernon.name)
    expect(page).to have_content(vernon.age)
    expect(page).to have_content(vernon.sex)
  end
end
