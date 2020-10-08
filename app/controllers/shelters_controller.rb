class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
      shelter.update(shelter_params)
      shelter.save
    redirect_to "/shelters/#{shelter.id}"
  end

  def create
    shelter = Shelter.new(shelter_params)
    shelter.save
    redirect_to '/shelters'
  end

  private

  def shelter_params
    params.permit(:name,:address,:city,:state,:zip)
  end


end
