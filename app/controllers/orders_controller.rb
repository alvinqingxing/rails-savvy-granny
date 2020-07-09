class OrdersController < ApplicationController
  def create
    booking = Booking.find(params[:booking_id])
    order = Order.create!(booking: booking, booking_sku: booking.sku, amount: booking.price, state: 'pending', user: current_user)
    authorize @order
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: booking.sku,
        amount: booking.price_cents,
        currency: 'sgd',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end
end
