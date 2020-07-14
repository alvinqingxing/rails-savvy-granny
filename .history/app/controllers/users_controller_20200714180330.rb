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
    params.require(:user).permit(:email, :first_name, :last_name, :photo)
  end
end


t.string "email", default: "", null: false
t.string "encrypted_password", default: "", null: false
t.string "reset_password_token"
t.datetime "reset_password_sent_at"
t.datetime "remember_created_at"
t.datetime "created_at", precision: 6, null: false
t.datetime "updated_at", precision: 6, null: false
t.string "first_name"
t.string "last_name"
t.boolean "tutor"
t.boolean "admin"
t.string "provider"
t.string "uid"
t.string "facebook_picture_url"
t.datetime "token_expiry"
t.text "description"