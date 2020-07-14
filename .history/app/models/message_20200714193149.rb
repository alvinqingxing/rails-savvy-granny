class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: "User"
  after_create :create_notification_message

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

end
