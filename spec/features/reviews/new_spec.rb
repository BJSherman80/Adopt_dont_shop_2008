require 'rails_helper'

RSpec.describe "shelters reviews page", type: :feature do
  it "can create a review" do
    user_1 = User.create( name: "Austin Powers",
                              address: "4555 Shag Ave",
                              city: "Denver",
                              state: "CO",
                              zip: 84444,
                              )
    shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                address: "1489 Balake Ave.",
                                city: "Denver",
                                state: "CO",
                                zip: "80201",
                                )

    visit "/shelters/#{shelter_1.id}"
    click_on 'New Review'
    expect(current_path).to eq("/shelters/#{shelter_1.id}/review")
    expect(page).to have_content("Title")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Content")

    expect(page).to have_content("Username")
    expect(page).to have_button("Create Review")
    fill_in :title, with: "Boo"
    fill_in :rating, with: 1
    fill_in :content, with: "This place sucks!"
    fill_in :name_of_user, with: "#{user_1.name}"

    click_on "Create Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Boo")
    expect(page).to have_content(1)
    expect(page).to have_content("This place sucks!")
    expect(page).to have_content("#{user_1.name}")
  end
end
