class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @jobs = Job.all
    @new_user = User.new
  end

  def dashboard
    @user = current_user
    if @user.tutor?
      @upcoming = Booking.where(tutor: current_user, status: "upcoming")
      @completed = Booking.where(tutor: current_user, status: "completed")
    else
      @pending = Booking.where(user: current_user, status: "pending")
      @upcoming = Booking.where(user: current_user, status: "upcoming")
      @completed = Booking.where(user: current_user, status: "completed")
    end   
  end


  # def notification
  #   if current_user
  #     @notifications = current_user.notifications
  #   end 
  # end


end
