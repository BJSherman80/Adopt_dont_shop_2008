class User < ApplicationRecord
  has_many :reviews
  validates_presence_of :name, :address, :city, :state, :zip

  def average_rating
    reviews.average(:rating)
  end
end
