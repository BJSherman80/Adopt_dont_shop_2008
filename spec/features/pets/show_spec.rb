require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can display pet info " do
    shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                address: "1489 Balake Ave.",
                                city: "Denver",
                                state: "CO",
                                zip: "80201",

                                )
    vernon = shelter_1.pets.create!(name: "Vernon", age: 18, sex: "male", image: "vernon.png" )

    visit "/pets/#{vernon.id}"
    expect(page).to have_content(vernon.name)
    expect(page).to have_content(vernon.age)
    expect(page).to have_content(vernon.sex)
    expect(page).to have_content(vernon.status)
  end
end
