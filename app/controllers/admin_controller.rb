class AdminController < ActionController::Base
  def show
    @application = Application.find(params[:id])
  end 

  def approve_pet
    application = Application.find(params[:id])
    pet = application.pets.where(id: params[:pet]).first
    pet.update(status: 'Approved')
    pet.save
    redirect_to "/admin/applications/#{application.id}"
  end
end