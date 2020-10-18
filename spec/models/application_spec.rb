require 'rails_helper'

describe Application, type: :model do

    describe "validations" do
      it { should validate_presence_of :name_of_user }
      it { should validate_presence_of :address}
      it { should validate_presence_of :description }
      it { should validate_presence_of :pets }
      it { should validate_presence_of :status }
    end

    describe 'relationships' do
      it { should belong_to :user }
      it { should have_many :pet_applications }
      it { should have_many(:pets).through(:pet_applications) }
    end
  end