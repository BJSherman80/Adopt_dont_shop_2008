require 'rails_helper'

describe Shelter, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many :reviews }
  end

  describe 'instance methods' do
    it 'can get average shelter review rating' do
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
      review = Review.create!(shelter_id: shelter1.id,
                              user_id: user1.id,
                              title: 'Horrible service',
                              rating: 5,
                              content: 'I saw a man slap a kitten',
                              picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                              name_of_user: 'Dr. Evil')
      expect(shelter1.average_shelter_rating).to eq(3)
      end
    end
    it 'can get count of pet applications' do
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
    application.pets << pet1
    expect(shelter1.count_of_pet_applications).to eq(1)
  end
end
