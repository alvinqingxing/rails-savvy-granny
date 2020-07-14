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

    # @chatrooom = Chatrooom.create(booking: ##) 
  end

  def notification
    @user = current_user
    if @user.tutor?
      # shuld be availble to see booking name & booking status is updated
      # chatroom is updated 
       
      #if booking status is updated, we should display, should I do that in model? as we discussed? 
    
    else 

    
    end 
  end
end
