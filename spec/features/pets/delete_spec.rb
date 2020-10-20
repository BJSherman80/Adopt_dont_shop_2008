require 'rails_helper'

RSpec.describe 'Pet', type: :feature do
  it 'can delete a pet' do
    shelter2 = Shelter.create(name: 'Phills World',
                                address: '1489 Balake Ave.',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80201')
    pet2 = shelter2.pets.create!(name: 'G', age: 18, sex: 'male', image: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg' )

    visit "/pets/#{pet2.id}"
      click_on 'Delete'
    expect(page).to_not have_content('G')
  end
end
