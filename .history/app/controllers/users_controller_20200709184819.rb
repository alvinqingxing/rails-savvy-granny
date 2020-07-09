class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @completed = Booking.where(tutor: @user, status: "completed")
    @rating = []
    @completed.each do |booking|
      @rating << booking
    end
  end
end
