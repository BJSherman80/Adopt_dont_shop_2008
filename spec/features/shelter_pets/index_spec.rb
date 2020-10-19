require 'rails_helper'

RSpec.describe 'Shelter_pets index page', type: :feature do
  it 'can see all pets attributes associated with specific shelter' do
    shelter1 = Shelter.create!(name: 'Sherms Spikey Friends',
                                address: '1489 Balake Ave.',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80201')

    pet1 = shelter1.pets.create!(name: 'Vernon', age: 18, sex: 'male', image: 'vernon.png')

    visit "/shelters/#{shelter1.id}/pets"
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
  end
end
