class OrdersController < ApplicationController
  def create
    @booking = current_user.bookings.new
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.job = Job.find(params[:job_id])
    @booking.price = params[:price].to_i
    @booking.status = 'pending'
    @booking.sku = 'My Lesson'
    @booking.chatroom = Chatroom.create
    authorize @booking
    @booking.save
    @order = Order.create!(booking: @booking, booking_sku: @booking.sku, amount: @booking.price, state: 'pending', user_id: current_user.id)
    authorize @order
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @booking.sku,
        amount: @booking.price_cents,
        currency: 'sgd',
        quantity: 1
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )
    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :start_time, :job, :price, :transaction_id, :user, :tutor, :language)
  end

end
