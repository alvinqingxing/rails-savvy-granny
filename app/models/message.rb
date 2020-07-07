class Message < ApplicationRecord
  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender'
  belongs_to :chatroom
end
