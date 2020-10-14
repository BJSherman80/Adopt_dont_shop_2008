class ReviewsController < ApplicationController
  def new
    @shelter = Shelter.find(params[:id])

    # @user = User.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    review = Review.new({title: params[:title],
                        rating: params[:rating],
                        content: params[:content],
                        name_of_user: params[:name_of_user],
                        user_id: params[:user_id],
                        shelter_id: params[:shelter_id]}
                      )
    review.save
  
    redirect_to "/shelters/#{@shelter.id}"
  end


  # private
  #
  # def review_params
  #   params.permit(:id, :title, :rating, :content, :picture, :name_of_user, shelter_id: params[:shelter_id], :user_id)
  # end
end
