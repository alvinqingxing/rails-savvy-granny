class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking])
    authorize @review
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    authorize @review

    if @review.save
      redirect_to dashboard_path
    else
      flash[:alert] = "Something went wrong."
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
    params.require(:review).permit(:rating, :content, :booking)
  end

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end
end
