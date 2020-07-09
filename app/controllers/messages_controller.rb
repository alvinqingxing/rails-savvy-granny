class MessagesController < ApplicationController
  before_action do
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def index
    @messages = @chatroom.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..]
    end
    if params[:m]
      @over_ten = false
      @messages = @chatroom.messages
    end
    @messages.each do |message|
      message.read = true if message.user_id != current_user.id
      message.save
    end
    @message = @chatroom.messages.new
  end

  def new
    @message = @chatroom.messages.new
  end

  def create
    @message = @chatroom.messages.new(message_params)
    redirect_to chatroom_messages_path(@chatroom, anchor: "message-#{@message.id}") if @message.save
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to chatroom_messages_path(@chatroom, anchor: "submit-box")
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end


end
