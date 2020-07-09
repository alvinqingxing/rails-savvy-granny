class MessagesController < ApplicationController
  
  before_action do
    @chatroom = chatroom.find(params[:chatroom_id])
  end

  def index
    @message = @chatroom.messages
    if
      
  end

  
  
  def create
    @message = current_user.messages.new(message_params)
    authorize @message

    if @message.save
      redirect_to @message
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content, :read)
  end
end
