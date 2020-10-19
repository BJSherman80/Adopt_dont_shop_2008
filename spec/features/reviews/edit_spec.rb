require 'rails_helper'

RSpec.describe 'Shelters reviews page', type: :feature do
  it 'can edit a review' do
    user1 = User.create(name: 'Austin Powers',
                        address: '4555 Shag Ave',
                        city: 'Denver',
                        state: 'CO',
                        zip: 84444)
    shelter1 = Shelter.create(name: 'Sherms Spikey Friends',
                              address: '1489 Balake Ave.',
                              city: 'Denver',
                              state: 'CO',
                              zip: '80201')
    review = Review.create!(shelter_id: shelter1.id,
                            user_id: user1.id,
                            title: 'Horrible service',
                            rating: 1,
                            content: 'I saw a man slap a kitten',
                            picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                            name_of_user: 'Dr. Evil')

    visit "/shelters/#{shelter1.id}"
    within("#review-#{review.id}") do
      click_on 'Edit Review'
    end
    fill_in :title, with: 'Extremely Horrible Crap Service'
    click_on 'Update Review'
    expect(page).to have_content('Extremely Horrible Crap Service')
  end
end
