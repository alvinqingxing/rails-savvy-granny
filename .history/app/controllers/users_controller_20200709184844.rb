class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @completed = Booking.where(tutor: @user, status: "completed")
    @rating = []
    @completed.each do |booking|
      unless booking.review.nil?
        @rating << booking.review.rating
      end
    end
  end
end
