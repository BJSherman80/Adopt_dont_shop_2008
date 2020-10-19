require 'rails_helper'

RSpec.describe 'Applications', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Dr. Evil',
                          address: '56774 FLower Ave.',
                          city: 'Smallville',
                          state: 'Alaska',
                          zip: 87645)
    @shelter1 = Shelter.create!(name: "Brett's Pet Palace",
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
                                      status: 'pending')
  end

  it 'can create a new application' do
    visit '/pets'
    click_on 'New Application'
    expect(current_path).to eq('/applications/user_validation')
    fill_in :name_of_user, with: 'Dr. Evil'
    click_button 'Submit'
    expect(page).to have_content(@user1.address)
    expect(page).to have_content('In Progress')
  end

  it 'can show a flash message when the user enters an invalid user name' do
    visit '/pets'
    click_on 'New Application'
    expect(current_path).to eq('/applications/user_validation')
    fill_in :name_of_user, with: 'Incorrect Username'
    click_button 'Submit'
    expect(page).to have_content('User does not exist. Please enter a valid username.')
  end
end
