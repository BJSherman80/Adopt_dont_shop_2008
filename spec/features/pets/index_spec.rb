require 'rails_helper'

RSpec.describe 'Pet index page', type: :feature do
  it 'can see all pets' do
    shelter1 = Shelter.create(name: 'Sherms Spikey Friends',
                                address: '1489 Balake Ave.',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80201')
    pet1 = shelter1.pets.create!(name: 'Vernon',
                                  age: 18,
                                  sex: 'male',
                                  image: 'vernon.png')

    visit '/pets'
    expect(page).to have_content(pet1.name)
    # expect(page).to have_xpath(pet1.image)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter.name)
  end
end
