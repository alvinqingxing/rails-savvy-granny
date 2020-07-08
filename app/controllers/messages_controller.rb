class MessagesController < ApplicationController
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
