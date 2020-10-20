require 'rails_helper'

describe Application, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name_of_user }
    it { should validate_presence_of :address }
    it { should validate_presence_of :status }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :pet_applications }
    it { should have_many(:pets).through(:pet_applications) }
  end

    describe 'instance methods' do
      it 'can see changed status for application' do
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
                                      image: 'vernon.png',
                                      status: "Approved")
      application = user1.applications.create!(name_of_user: 'Dr. Evil',
                                        address: '56774 FLower Ave.',
                                        description: 'I love this hairless cat',
                                        status: 'Pending')
      pet2 = shelter1.pets.create!(name: 'Billy',
                                      age: 18,
                                      sex: 'male',
                                      image: 'vernon.png',
                                      status: "Approved")
      application.pets << pet2
      application.pets << pet1
      expect(application.status).to eq("Pending")
      application.update_app_status
      expect(application.status).to eq("Approved")
    end
  end
end
