class Application < ApplicationRecord
  validates_presence_of :name_of_user, :address, :status 
  belongs_to :user
  has_many :pet_applications
  has_many :pets, through: :pet_applications 
end