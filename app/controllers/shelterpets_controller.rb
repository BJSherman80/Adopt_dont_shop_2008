class ShelterpetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
    @shelter_pets = Shelter.find(params[:id]).pets
  end
end
