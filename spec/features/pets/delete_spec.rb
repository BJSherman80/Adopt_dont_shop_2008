require 'rails_helper'

RSpec.describe 'Pet', type: :feature do
  it 'can delete a pet' do
    shelter1 = Shelter.create(name: 'Sherms Spikey Friends',
                                address: '1489 Balake Ave.',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80201')
    pet1 = shelter1.pets.create!(name: 'pet1', age: 18, sex: 'male', image: 'vernon.png')

    visit "/pets/#{pet1.id}"
    click_on 'Delete'
    expect(page).to_not have_content('Vernon')
  end
end
