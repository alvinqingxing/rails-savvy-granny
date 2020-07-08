class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    authorize @page
    @jobs = Job.all
    @new_user = User.new
  end

  def dashboard
    @user = current_user
    @pending = Booking.where(user: current_user, status: "pending")
    @upcoming = Booking.where(user: current_user, status: "upcoming")
    @completed = Booking.where(user: current_user, status: "completed")
  end
end
