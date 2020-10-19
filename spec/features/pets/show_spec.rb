require 'rails_helper'

RSpec.describe 'Pets show page', type: :feature do
  it 'can display pet info ' do
    shelter1 = Shelter.create!(name: 'Sherms Spikey Friends',
                              address: '1489 Balake Ave.',
                              city: 'Denver',
                              state: 'CO',
                              zip: '80201')
    pet1 = shelter1.pets.create!(name: 'Vernon',
                                age: 18,
                                sex: 'male',
                                image: 'vernon.png',
                                description: 'Lovable little dude.')

    visit "/pets/#{pet1.id}"
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.status)
    expect(page).to have_content(pet1.description)
  end
end
