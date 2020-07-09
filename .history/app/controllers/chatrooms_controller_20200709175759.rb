class ChatroomsController < ApplicationController
      
  def index
    @chatrooms = Chatrooms.all
    @users = User.all
  end
  
  def show
    @chatroom = Chatroom.find_by(booking_id: params[:booking_id])
    @messages = @chatroom.messages
    
    @message = Message.new


    authorize @chatroom
  end

end
