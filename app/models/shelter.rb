class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :applications, through: :pets
  validates_presence_of :name, :address, :city, :state, :zip

  def average_shelter_rating
    reviews.average(:rating)
  end

  def count_of_pet_applications
    applications.count
  end

end
