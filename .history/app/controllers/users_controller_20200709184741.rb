class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @completed = Booking.where(tutor: @user, status: "completed")
    @rating = []
    @completed.each do |booking|
      if booking.review.rating.nil? == false
        @rating << booking.review.rating
      end
    end
  end
end
