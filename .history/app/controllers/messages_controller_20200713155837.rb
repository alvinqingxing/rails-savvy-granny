class MessagesController < ApplicationController

#do we need this? I am bit confused? 

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom

    authorize @message

    @message.save

    redirect_to booking_chatroom_path(@chatroom.booking)

  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end 

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
