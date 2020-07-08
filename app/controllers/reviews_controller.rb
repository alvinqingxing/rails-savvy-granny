class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]

  def create
    @review = current_user.reviews.new(review_params)
    authorize @review

    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end
end
