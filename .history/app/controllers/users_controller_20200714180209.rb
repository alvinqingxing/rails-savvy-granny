class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @completed = Booking.where(tutor: @user, status: "completed")
    @cancelled = Booking.where(user: @user, status: "cancelled").count
    @rating = []
    @completed.each do |booking|
      @rating << booking.review.rating unless booking.review.nil?
    end
    @rating = @rating.reduce(:+).to_f / @rating.size
    if @user.tutor?
      @reviews = []
      @completed.each do |booking|
        @reviews << booking.review unless booking.review.nil?
      end
    else
      @reviews = @user.reviews
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:photo)
  end
end
