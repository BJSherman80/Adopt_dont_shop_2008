require 'rails_helper'

describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe 'relationships' do
    it { should have_many :reviews }
  end

  describe 'instance methods' do 
    it 'can find the users average review rating' do 
      user_1 = User.create( name: "Austin Powers",
                            address: "4555 Shag Ave",
                            city: "Denver",
                            state: "CO",
                            zip: 84444,
                            )
      shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                  address: "1489 Balake Ave.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80201",
                                  )
      review_1 = Review.create!(shelter_id: shelter_1.id,
                              user_id: user_1.id, 
                              title: "Horrible service",
                              rating: 1, 
                              content: "I saw a man slap a kitten",
                              picture: "https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg",
                              name_of_user: "Austin Powers")
      review_2 = Review.create!(shelter_id: shelter_1.id,
                              user_id: user_1.id, 
                              title: "Mediocre Service",
                              rating: 5, 
                              content: "Had hairless cats.",
                              picture: "https://felineengineering.com/wp-content/uploads/2019/07/Adorable-sad-kitten-e1562788887775-974x1024.jpg",
                              name_of_user: "Austin Powers")

      expect(user_1.average_rating).to eq(3)
    end 
  end
end
