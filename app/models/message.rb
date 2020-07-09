class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: "User"

  validates_presence_of :content, :chatroom_id, :sender_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
