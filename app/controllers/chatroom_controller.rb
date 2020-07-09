class ChatroomController < ApplicationController
  
  def index
    @chatrooms = Chatrooms.all
    @users = User.all
  end
  
  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end
