class User < ApplicationRecord
  has_many :reviews
  has_many :applications
  validates_presence_of :name, :address, :city, :state, :zip

  def average_rating
    reviews.average(:rating)
  end

  def highest_rating
    if self.reviews.present?
      self.reviews.order(rating: :desc).first 
    end 
  end

  def lowest_rating
    if self.reviews.present?
      self.reviews.order(:rating).first 
    end 
  end 
end
