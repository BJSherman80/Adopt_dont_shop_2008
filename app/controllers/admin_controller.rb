class AdminController < ActionController::Base
  def show
    @application = Application.find(params[:id])
  end

  def approve_pet
    application = Application.find(params[:id])
    pet = application.pets.where(id: params[:pet]).first
      pet.update(status: 'Pending')
      flash[:notice] = "#{pet.name} hase been approved!"
        if application.pets.all?{|pet| pet.status == "Pending"}
          application.update(status: "Approved")
        end
    redirect_to "/admin/applications/#{application.id}"
  end

  def reject_pet
    application = Application.find(params[:id])
    pet = application.pets.where(id: params[:pet]).first
      pet.update(status: 'Adoptable')
      application.update(status: "Rejected")
      flash[:notice] = "#{pet.name} hase been Rejected."
    redirect_to "/admin/applications/#{application.id}"
  end
end
