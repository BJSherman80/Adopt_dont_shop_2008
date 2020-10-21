require 'rails_helper'

RSpec.describe 'Shelters show page', type: :feature do
  it 'can see shelter info' do
    shelter1 = Shelter.create(name: 'Sherms Spikey Friends',
                              address: '1489 Balake Ave.',
                              city: 'Denver',
                              state: 'CO',
                              zip: '80201')

    visit "/shelters/#{shelter1.id}"
    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)
  end

  it 'can see a list of reviews' do
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
    # question: how else would we create this review with two foreign keys
    visit "/shelters/#{shelter1.id}"
    expect(page).to have_content(review.title)
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.content)
    # question: expect(page).to x_path('https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg')
    expect(page).to have_content(review.name_of_user)
  end

  it 'can see pet count, average shelter rating, and count of pets' do
    user1 = User.create!(name: 'Dr. Evil',
                          address: '56774 FLower Ave.',
                          city: 'Smallville',
                          state: 'Alaska',
                          zip: 87645)
    shelter1 = Shelter.create(name: "Brett's Pet Palace",
                                address: '456 Sesame Ave',
                                city: 'Denver',
                                state: 'CO',
                                zip: 80222)
    pet1 = shelter1.pets.create!(name: 'Vernon',
                                    age: 18,
                                    sex: 'male',
                                    image: 'vernon.png')
    application = user1.applications.create!(name_of_user: 'Dr. Evil',
                                      address: '56774 FLower Ave.',
                                      description: 'I love this hairless cat',
                                      status: 'In Progress')

    review = Review.create!(shelter_id: shelter1.id,
                            user_id: user1.id,
                            title: 'Horrible service',
                            rating: 1,
                            content: 'I saw a man slap a kitten',
                            picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                            name_of_user: 'Dr. Evil')
    application.pets << pet1
    visit "/shelters/#{shelter1.id}"
    expect(page).to have_content("Pet Count: 1")
    expect(page).to have_content("Average Shelter Review Rating: 1")
    expect(page).to have_content("Applications on file for pets: 1")
  end

  it 'can see pet count, average shelter rating, and count of pets' do

    shelter1 = Shelter.create(name: "Brett's Pet Palace",
                                address: '456 Sesame Ave',
                                city: 'Denver',
                                state: 'CO',
                                zip: 80222)
    pet1 = shelter1.pets.create!(name: 'Vernon',
                                age: 18,
                                sex: 'male',
                                image: 'vernon.png',
                                status: "Pending")


    visit "/shelters/#{shelter1.id}"
    expect(page).to_not have_content("Delete")
  end
end
