require 'rails_helper'

RSpec.describe 'Applications', type: :feature do
  before(:each) do 
    @user_1 = User.create!(name: "Dr. Evil",
                          address: "56774 FLower Ave.",
                          city: "Smallville",
                          state: "Alaska",
                          zip: 87645)
    @shelter_1 = Shelter.create( name: "Brett's Pet Palace",
                                address: "456 Sesame Ave",
                                city: "Denver",
                                state: "CO",
                                zip: 80222)
    @pet_1 = @shelter_1.pets.create!(name: "Vernon", 
                                    age: 18, 
                                    sex: "male", 
                                    image: "vernon.png")
    application = @user_1.applications.create!(name_of_user: "Dr. Evil",
                                      address: "56774 FLower Ave.",
                                      description: "I love this hairless cat",
                                      pets: [@pet_1],
                                      status: "pending")
  end 

  it 'create a new application' do
    visit "/pets"
    click_on 'New Application'
    expect(current_path).to eq("/applications/user_validation")
    fill_in :name_of_user, with: "Dr. Evil"
    click_button 'Submit'
    expect(page).to have_content(@user_1.address)
    expect(page).to have_content("In Progress")
  end

  it 'can show a flash message when I create an invalid user' do
    visit "/pets"
    click_on 'New Application'
    expect(current_path).to eq("/applications/user_validation")
    fill_in :name_of_user, with: "Incorrect Username"
    click_button 'Submit'
    expect(page).to have_content("User does not exist. Please enter a valid username.")
  end
end