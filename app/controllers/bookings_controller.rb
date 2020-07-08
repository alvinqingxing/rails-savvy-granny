class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = current_user.bookings.new
    authorize @booking
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    authorize @booking

    if @booking.save
      redirect_to @booking
    else
      render :new
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
end
