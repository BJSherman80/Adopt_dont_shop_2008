class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shelter
  validates_presence_of :title, :rating, :content, :name_of_user, :user_id
end
