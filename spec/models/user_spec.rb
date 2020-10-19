require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe 'relationships' do
    it { should have_many :reviews }
    it { should have_many :applications }
  end

  describe 'instance methods' do
    it 'can find the users average review rating' do
      user1 = User.create!(name: 'Austin Powers',
                          address: '4555 Shag Ave',
                          city: 'Denver',
                          state: 'CO',
                          zip: 84444)
      shelter1 = Shelter.create!(name: 'Sherms Spikey Friends',
                                address: '1489 Balake Ave.',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80201')
      review1 = Review.create!(shelter_id: shelter1.id,
                              user_id: user1.id,
                              title: 'Horrible service',
                              rating: 1,
                              content: 'I saw a man slap a kitten',
                              picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                              name_of_user: 'Austin Powers')
      review2 = Review.create!(shelter_id: shelter1.id,
                                user_id: user1.id,
                                title: 'Mediocre Service',
                                rating: 5,
                                content: 'Had hairless cats.',
                                picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                                name_of_user: 'Austin Powers')

      expect(user1.average_rating).to eq(3)
    end

    it 'can calculate the highest and lowest rating' do
      user1 = User.create!(name: 'Austin Powers',
                            address: '4555 Shag Ave',
                            city: 'Denver',
                            state: 'CO',
                            zip: 84444)
      shelter1 = Shelter.create!(name: 'Sherms Spikey Friends',
                                  address: '1489 Balake Ave.',
                                  city: 'Denver',
                                  state: 'CO',
                                  zip: '80201')
      review1 = Review.create!(shelter_id: shelter1.id,
                              user_id: user1.id,
                              title: 'Horrible service',
                              rating: 1,
                              content: 'I saw a man slap a kitten',
                              picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                              name_of_user: 'Austin Powers')
      review2 = Review.create!(shelter_id: shelter1.id,
                              user_id: user1.id,
                              title: 'Mediocre Service',
                              rating: 5,
                              content: 'Had hairless cats.',
                              picture: 'https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg',
                              name_of_user: 'Austin Powers')

      expect(user1.highest_rating).to eq(review2)
      expect(user1.lowest_rating).to eq(review1)
    end
  end
end
