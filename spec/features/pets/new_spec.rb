require 'rails_helper'

RSpec.describe 'Create new pet ', type: :feature do
  it 'can create pet' do
    shelter1 = Shelter.create!(name: 'Sherms Spikey Friends',
                                address: '1489 Balake Ave.',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80201')
    pet1 = shelter1.pets.create!(name: 'Vernon',
                                  age: 18,
                                  sex: 'male',
                                  image: 'vernon.png')

    visit "/shelters/#{shelter1.id}/pets"
    click_on 'Create Pet'
    fill_in :name, with: 'Clifford'
    fill_in :image, with: 'https://cdn3-www.dogtime.com/assets/uploads/gallery/chow-chow-dog-breed-pictures/3-fullbody.jpg'
    fill_in :age, with: 1
    fill_in :sex, with: 'Female'
    fill_in :sex, with: 'Big and fluffy'
    click_on 'Create Pet'
    expect(current_path).to eq("/shelters/#{shelter1.id}/pets")
    expect(page).to have_content('Vernon')
    expect(page).to have_content('Clifford')
  end
end
