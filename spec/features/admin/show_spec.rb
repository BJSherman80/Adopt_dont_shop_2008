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
                                      status: 'In Progress')
    @application.pets << @pet1
  end

  it 'can approve and application' do
    visit "admin/applications/#{@application.id}"
    expect(page).to have_content(@pet1.name)
    click_on 'Approve'
    expect(current_path).to eq("/admin/applications/#{@application.id}")
    within("#pet-#{@pet1.id}") do
      expect(page).to have_content('Approved')
    end 
  end

  it 'can reject an application' do 
    visit "admin/applications/#{@application.id}"
    expect(page).to have_content(@pet1.name)
    click_on 'Reject'
    expect(current_path).to eq("/admin/applications/#{@application.id}")
    within("#pet-#{@pet1.id}") do
      expect(page).to have_content('Rejected')
    end 
  end
end