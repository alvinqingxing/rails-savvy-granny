class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatrooms.all
    @users = User.all
  end

  def show
    @chatroom = Chatroom.find_by(booking_id: params[:booking_id])
    @messages = @chatroom.messages
    @messages.each do |message|
      message.read = true if message.sender_id != current_user.id
      message.save
    end
    @message = Message.new
    authorize @chatroom
    redirect_to booking_chatroom_path(@chatroom, anchor: "message-#{@message.id}")
  end
end
