require 'rails_helper'

RSpec.describe 'Application show page', type: :feature do
  it 'can see application info' do
    user_1 = User.create!(name: "Dr. Evil",
                          address: "56774 FLower Ave.",
                          city: "Smallville",
                          state: "Alaska",
                          zip: 87645)
    shelter_1 = Shelter.create( name: "Brett's Pet Palace",
                                address: "456 Sesame Ave",
                                city: "Denver",
                                state: "CO",
                                zip: 80222)
    pet_1 = shelter_1.pets.create!(name: "Vernon", 
                                    age: 18, 
                                    sex: "male", 
                                    image: "vernon.png")
    application = user_1.applications.create!(name_of_user: "Dr. Evil",
                                      address: "56774 FLower Ave.",
                                      description: "I love this hairless cat",
                                      pets: [pet_1],
                                      status: "pending")

      visit "applications/#{application.id}"
      save_and_open_page
      expect(page).to have_content(application.name_of_user)
      expect(page).to have_content(application.address)
      expect(page).to have_content(application.description)
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(application.status)
    end
  end