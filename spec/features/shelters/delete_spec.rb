require 'rails_helper'

RSpec.describe 'Shelter can be deleted', type: :feature do
  it 'can delte a shelter' do
    shelter1 = Shelter.create(name: 'Sherms Spikey Friends',
                              address: '1489 Balake Ave.',
                              city: 'Denver',
                              state: 'CO',
                              zip: '80201')

    visit "/shelters/#{shelter1.id}"
    click_on 'Delete'
    expect(page).to_not have_content('Sherms Spikey Friends')
  end
end
