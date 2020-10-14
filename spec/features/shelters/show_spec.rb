require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
    it "can see shelter info" do
      shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                  address: "1489 Balake Ave.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80201",
                                  )

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end

  it "can see a list of reviews" do
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


    review = Review.create!(shelter_id: shelter_1.id, user_id: user_1.id, title: "Horrible service", rating: 1, content: "I saw a man slap a kitten", picture: "https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg", name_of_user: "Dr. Evil")
    # question: how else would we create this review with two foreign keys
    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content(review.title)
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.content)
     # question: expect(page).to x_path("https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg")
    expect(page).to have_content(review.name_of_user)
  end

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
    fill_in :name_of_user, with: "Calvin"
    fill_in :user_id, with: "#{user_1.id}"
    click_on "Create Review"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Boo")
    expect(page).to have_content(1)
    expect(page).to have_content("This place sucks!")
    expect(page).to have_content("Calvin")


  end
end
