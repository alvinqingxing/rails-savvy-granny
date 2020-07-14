class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :apply, :cancel]

  def index
    @bookings = policy_scope(Booking).where(status: "pending")
  end

  def apply
    @booking.tutor = current_user
    @booking.status = "upcoming"

    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to bookings_path
    end
  end

  def cancel
    @booking.status = "cancelled"
    @booking.save
    redirect_to dashboard_path
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

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :start_time, :job, :price, :transaction_id, :user, :tutor, :language)
  end
end
