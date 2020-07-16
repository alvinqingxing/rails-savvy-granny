class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: "User"
  has_one :notification, dependent: :destroy
  after_create :create_notification_message
  after_create :broadcast_message

  def receiver
    tutor = chatroom.booking.tutor
    user = chatroom.booking.user
    if user == sender
      tutor
    else
      user
    end
  end

  def create_notification_message
    new_noti = Notification.new(message: self, user: self.receiver, booking: self.chatroom.booking, read: false)
    new_noti.save
  end

  def broadcast_message

 
    ActionCable.server.broadcast("chat_room_#{chatroom.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self, author: self.sender.id, boolean: true}
      ),
      current_user_id: sender.id
    })

  
  end
end
