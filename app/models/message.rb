class Message < ApplicationRecord
  belongs_to :sender, class_name :user, foreign_key :sender
  belongs_to :chatroom
end
