class ChatroomController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end
