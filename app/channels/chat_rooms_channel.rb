class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_#{params[:chatroom_id]}"
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
