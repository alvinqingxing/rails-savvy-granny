class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = current_user.bookings.new
    authorize @booking
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
    authorize @booking
   
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
    @booking.update(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :price, :status, :transaction_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :start_time, :job, :price, :transaction_id, :user, :tutor)
  end
end