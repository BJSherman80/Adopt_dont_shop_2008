class User < ApplicationRecord
  has_many :reviews
  validates_presence_of :name, :address, :city, :state, :zip

  def average_rating
    reviews.average(:rating)
  end

  def highest_rating
    reviews.order(rating: :desc).first
  end

  def lowest_rating
    reviews.order(:rating).first
  end
end
