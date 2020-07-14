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
      @reviews = []
      @completed.each do |booking|
        @reviews << booking.review unless booking.review.nil?
        @cancelled = Booking.where(tutor: @user, status: "cancelled").count
      end
    else
      @reviews = @user.reviews
      @cancelled = Booking.where(user: @user, status: "cancelled").count
    end
  end

  def update
    @user = current_user
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    flash[:success] = "Account deleted."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :description, :photo)
  end
end
