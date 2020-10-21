require 'rails_helper'

RSpec.describe 'On a Pet Applications show page a user', type: :feature do
  it 'can see application info' do
    user1 = User.create!(name: 'Dr. Evil',
                          address: '56774 FLower Ave.',
                          city: 'Smallville',
                          state: 'Alaska',
                          zip: 87645)
    shelter1 = Shelter.create(name: "Brett's Pet Palace",
                                address: '456 Sesame Ave',
                                city: 'Denver',
                                state: 'CO',
                                zip: 80222)
    pet1 = shelter1.pets.create!(name: 'Vernon',
                                    age: 18,
                                    sex: 'male',
                                    image: 'vernon.png')
    application = user1.applications.create!(name_of_user: 'Dr. Evil',
                                      address: '56774 FLower Ave.',
                                      description: 'I love this hairless cat',
                                      status: 'In Progress')
    application.pets << pet1

    visit "/pets/#{pet1.id}"

    expect(page).to have_content("Pet's Applications")
    click_on "Pet's Applications"
    expect(current_path).to eq("/pets/#{pet1.id}/applications")
    expect(page).to have_content(user1.name)
    expect(page).to have_content(application.description)
  end

  it "if there aren't aren't any applications for this pet it will display a message" do
    shelter1 = Shelter.create(name: "Brett's Pet Palace",
                                address: '456 Sesame Ave',
                                city: 'Denver',
                                state: 'CO',
                                zip: 80222)
    pet1 = shelter1.pets.create!(name: 'Vernon',
                                    age: 18,
                                    sex: 'male',
                                    image: 'vernon.png')

    visit "/pets/#{pet1.id}/applications"
    expect(page).to have_content("There are no applications for this pet.")
  end
end 