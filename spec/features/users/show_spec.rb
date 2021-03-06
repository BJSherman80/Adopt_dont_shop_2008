require 'rails_helper'
RSpec.describe 'User show page', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'Dr. Evil',
                          address: '56774 FLower Ave.',
                          city: 'Smallville',
                          state: 'Alaska',
                          zip: 87645)
    @shelter1 = Shelter.create!(name: "Brett's Pet Palace",
                                address: '456 Sesame Ave',
                                city: 'Denver',
                                state: 'CO',
                                zip: 80222)
    @review1 = Review.create!(shelter_id: @shelter1.id,
                              user_id: @user1.id,
                              title: 'Horrible service',
                              rating: 1,
                              content: 'I saw a man slap a kitten',
                              picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                              name_of_user: 'Dr. Evil')
    @review2 = Review.create!(shelter_id: @shelter1.id,
                              user_id: @user1.id,
                              title: 'Mediocre Service',
                              rating: 5,
                              content: 'Had Hairless Cats',
                              picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                              name_of_user: 'Dr. Evil')
    @review3 = Review.create!(shelter_id: @shelter1.id,
                              user_id: @user1.id,
                              title: 'Mediocre Service',
                              rating: 3,
                              content: 'Had Hairless Cats',
                              picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                              name_of_user: 'Dr. Evil')
  end

  it 'can see all users info' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.address)
    expect(page).to have_content(@user1.city)
    expect(page).to have_content(@user1.state)
    expect(page).to have_content(@user1.zip)
  end

  it 'can see all users reviews' do
    visit "/users/#{@user1.id}"
    expect(page).to have_content(@review1.title)
    expect(page).to have_content(@review1.rating)
    expect(page).to have_content(@review1.content)
  end

  it 'can see the users average rating' do
    visit "/users/#{@user1.id}"
    within("#av_user_rating") do
      expect(page).to have_content('Average: 3')
    end
  end

  it 'see a section for Highlighted Reviews' do
    visit "/users/#{@user1.id}"

    within("#highest-review") do
      expect(page).to have_content('5')
      expect(page).to have_content('Mediocre Service')
      expect(page).to have_content('Had Hairless Cats')
    end
    within("#lowest-review") do
      expect(page).to have_content('1')
      expect(page).to have_content('Horrible service')
      expect(page).to have_content('I saw a man slap a kitten')
    end
  end
end
