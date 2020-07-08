class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @jobs = Job.all
    @new_user = User.new
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
  end
end
