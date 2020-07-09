class ChatroomController < ApplicationController
  before_action :authenticate_user

  def show
    @chatroom = Chatroom.find(params[:id])
    @l = @user.lairs

  end
end
