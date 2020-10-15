require 'rails_helper'

RSpec.describe Review, type: :model do

    describe "validations" do
      it { should validate_presence_of :title }
      it { should validate_presence_of :rating }
      it { should validate_presence_of :content }
      it { should validate_presence_of :name_of_user }
      it { should validate_presence_of :user_id }
    end

    describe 'relationships' do
      it { should belong_to :shelter }
      it { should belong_to :user }
    end
  end
