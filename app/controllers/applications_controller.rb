class ApplicationsController < ApplicationController 
  def show
    @application = Application.find(params[:id])
  end

  def user_validation
    @applications = Application.all 
  end

  def create 
    if User.exists?(name: params[:name_of_user]) 
      user = User.where(name: params[:name_of_user]).first
      application = user.applications.new(name_of_user: user.name,
                                    address: user.address,
                                    status: "In Progress")
    application.save
    redirect_to "/applications/#{application.id}"
    else 
      flash[:notice] = "User does not exist. Please enter a valid username."
      return render :new
    end
  end
end