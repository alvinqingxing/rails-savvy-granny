class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
    @job = Job.find(params[:job])
  end

  def create
    @booking = Booking.new(booking_params)
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
    params.require(:booking).permit(:start_time, :price, :status, :transaction_id, :job, :user, :tutor)
  end
end
