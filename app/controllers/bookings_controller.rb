class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
    @job = Job.find(params[:job])
    if @job.duration == 10
      @cost = 5
    else
      @cost = @job.duration / 3
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.job = Job.find(params[:job_id])
    @booking.price = params[:price].to_i
    @booking.status = 'pending'
    @booking.chatroom = Chatroom.create
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :start_time, :job, :price, :transaction_id, :user, :tutor)
  end
end