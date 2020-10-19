require 'rails_helper'

RSpec.describe 'Pets edit page', type: :feature do
  it 'can update pet' do
    shelter1 = Shelter.create(name: 'Sherms Spikey Friends',
                              address: '1489 Balake Ave.',
                              city: 'Denver',
                              state: 'CO',
                              zip: '80201')
    pet1 = shelter1.pets.create!(name: 'Vernon',
                                  age: 18,
                                  sex: 'male',
                                  image: 'vernon.png')

    visit "/pets/#{pet1.id}"
    click_on 'Update Pet'
    fill_in :name, with: 'Sammy'
    expect(page).to have_button('Submit')
    click_on 'Submit'
    expect(page).to have_content('Sammy')
    expect(page).to have_content('male') # make sure the unchanged values still exist
  end
end
