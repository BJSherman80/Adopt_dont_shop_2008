require 'rails_helper'

describe Pet, type: :model do

    describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :age }
      it { should validate_presence_of :sex }
    end

    describe 'relationships' do
      it { should belong_to :shelter }
    end
  end

  describe 'instance method' do
    it "defaults status of adoptable" do
      shelter_1 = Shelter.create( name: "Sherms Spikey Friends",
                                  address: "1489 Balake Ave.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80201",
                                  )

      vernon = shelter_1.pets.create!(name: "Vernon", age: 18, sex: "male", image: "vernon.png" )

     expect(vernon.status).to eq("Adoptable")
  end
end
