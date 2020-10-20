class Application < ApplicationRecord
  validates_presence_of :name_of_user, :address, :status
  belongs_to :user
  has_many :pet_applications
  has_many :pets, through: :pet_applications

    def update_app_status
      if pets.all{|pet| pet.status == "Approved"}
        self.update(status: "Approved")
      elsif pets.any?{|pet| pet.status == "Rejected"}
        self.update(status: "Rejected")
      else
        self.update(status: "In Progress")
      end
    end

end
