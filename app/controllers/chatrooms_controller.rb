class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatrooms.all
    @users = User.all
  end

  def show
   
    @chatroom = Chatroom.find_by(booking_id: params[:booking_id])

    @messages = @chatroom.messages
    @messages.each do |message|
      if message.sender_id != current_user.id
        message.read = true
      end 
      message.save
    end
    @message = Message.new
    authorize @chatroom

  end
end
