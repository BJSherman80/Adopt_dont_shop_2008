class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pets = Pet.all
    @search_results = []
    if params[:search] != '' && !search_params.nil?
      @search_results = @pets.where('name like ?', "#{search_params}")
    end
  end

  def user_validation
    @applications = Application.all
  end

  def create
    if User.exists?(name: params[:name_of_user])
      user = User.where(name: params[:name_of_user]).first
      application = user.applications.new(name_of_user: user.name,
                                          address: user.address,
                                          status: 'In Progress')
      application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = 'User does not exist. Please enter a valid username.'
      render :user_validation
    end
  end

  def update 
    app = Application.find(params[:id])
    pet = Pet.find(params[:pet])
    app.pets << pet 
    redirect_to "/applications/#{app.id}"
  end

  private 

  def search_params 
    params.permit(:search)
  end 
end
