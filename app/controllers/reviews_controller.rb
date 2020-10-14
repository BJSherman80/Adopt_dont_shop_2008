class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    review = Review.new(review_params)
    review.save
    redirect_to "/shelters/#{@shelter.id}"
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:review_id])
      review.update(review_params)
      review.save
    redirect_to "/shelters/#{review.shelter_id}"
  end


  private

  def review_params
    params.permit(:id, :title, :rating, :content, :picture, :name_of_user, :shelter_id, :user_id)
  end

end
