require 'rails_helper'

RSpec.describe 'Application show page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Dr. Evil',
                          address: '56774 FLower Ave.',
                          city: 'Smallville',
                          state: 'Alaska',
                          zip: 87645)
    @shelter1 = Shelter.create(name: "Brett's Pet Palace",
                                address: '456 Sesame Ave',
                                city: 'Denver',
                                state: 'CO',
                                zip: 80222)
    @pet1 = @shelter1.pets.create!(name: 'Vernon',
                                    age: 18,
                                    sex: 'male',
                                    image: 'vernon.png')
    @application = @user1.applications.create!(name_of_user: 'Dr. Evil',
                                      address: '56774 FLower Ave.',
                                      description: 'I love this hairless cat',
                                      pets: [@pet1],
                                      status: 'In Progress')
  end

  it 'can see application info' do
    visit "applications/#{@application.id}"

    expect(page).to have_content(@application.name_of_user)
    expect(page).to have_content(@application.address)
    expect(page).to have_content(@application.description)
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@application.status)
  end

  it 'search for a pet to add to the application' do
    pet2 = @shelter1.pets.create!(name: 'Bob',
                                  age: 12,
                                  sex: 'male')
    visit "/applications/#{@application.id}"
    expect(page).to have_content('In Progress')
    fill_in :search, with: 'Bob'
    click_button 'Search'
    expect(current_path).to eq("/applications/#{@application.id}")
    expect(page).to have_content(pet2.name)
    click_on "Adopt This Pet"
    expect(current_path).to eq("/applications/#{@application.id}")
    within(".show") do 
      expect(page).to have_content(pet2.name)
    end
  end
end
