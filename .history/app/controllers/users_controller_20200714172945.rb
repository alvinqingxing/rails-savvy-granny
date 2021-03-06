class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @completed = Booking.where(tutor: @user, status: "completed")
    @cancelled = Booking.where(user: @user, status: "cancelled").count
    if @user.tutor?
      @rating = []
      @reviews = []
      @completed.each do |booking|
        @rating = @rating.reduce(:+).to_f / @rating.size
        @rating << booking.review.rating unless booking.review.nil?
        @reviews << booking.review
      end
    else
      @reviews = @user.reviews
    end
  end
end
