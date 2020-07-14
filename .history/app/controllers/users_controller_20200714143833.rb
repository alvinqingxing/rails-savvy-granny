class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @completed = Booking.where(tutor: @user, status: "completed")
    @rating = []
    @completed.each do |booking|
      @rating << booking.review.rating unless booking.review.nil?
    end
    @rating = @rating.reduce(:+).to_f / @rating.size
    if @user.tutor?
      @reviews = Review.where(id: @user.id)
    else
      @reviews = @user.reviews
    end
  end
end
