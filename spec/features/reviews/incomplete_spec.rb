require 'rails_helper'

RSpec.describe 'Flash notice when form is incomplete', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Austin Powers',
                          address: '4555 Shag Ave',
                          city: 'Denver',
                          state: 'CO',
                          zip: 84444)
    @shelter1 = Shelter.create(name: 'Sherms Spikey Friends',
                                address: '1489 Balake Ave.',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80201')
    @review = Review.create!(shelter_id: @shelter1.id,
                            user_id: @user1.id, title: 'Horrible service',
                            rating: 1, content: 'I saw a man slap a kitten',
                            picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                            name_of_user: 'Dr. Evil')
  end

  it 'will display a flash message if the user does not exist' do
    visit "/shelters/#{@shelter1.id}"

    click_on 'New Review'

    fill_in :title, with: 'Extremely Horrible Crap Service'
    fill_in :rating, with: 0
    fill_in :content, with: 'The goldfish were fighting'
    fill_in :name_of_user, with: 'Cruella Deville'

    click_on 'Create Review'

    expect(page).to have_content('User does not exist. Please enter a valid username.')
  end

  it 'can provide a flash notice when the user creates a review' do
    visit "/shelters/#{@shelter1.id}"

    click_on 'New Review'

    fill_in :title, with: ''
    fill_in :rating, with: 1
    fill_in :content, with: 'The goldfish were fighting'
    fill_in :name_of_user, with: 'Austin Powers'

    click_on 'Create Review'

    expect(page).to have_content('All fields must be filled in to submit review.')
  end

  it 'can provide a flash notice when the user edits a review' do
    visit "/shelters/#{@shelter1.id}"
    within("#review-#{@review.id}") do
      click_on 'Edit Review'
    end
    fill_in :title, with: 'Extremely Horrible Crap Service'
    fill_in :rating, with: 0
    fill_in :content, with: 'The goldfish were fighting'
    fill_in :name_of_user, with: ''
    click_on 'Update Review'

    expect(page).to have_content('Please fill out all fields to update review.')
  end
end
